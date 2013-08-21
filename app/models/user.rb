require 'securerandom'

class TokenValidator < ActiveModel::Validator
end

class User < ActiveRecord::Base

  validates :login, 
    presence: true, 
    length: {maximum: 40},
    uniqueness: {case_sensitive: false}

  validates_with TokenValidator, on: :create 
  after_create :delete_token, if: :valid?
  
  has_secure_password
  validates :password, length: {minimum: 8}, on: :create

  before_create :create_session_token

  attr_accessor :sign_in_token

  has_many :decks
  belongs_to :game
  has_many :actions

  def User.new_session_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt token
    Digest::SHA1.hexdigest(token.to_s)
  end

  protected
  def delete_token
    token = SignInToken.find_by_text self.sign_in_token
    token.destroy if self.valid?
  end

  def create_session_token
    self.session_token = User.encrypt(User.new_session_token)
  end

end

class TokenValidator
  def validate(record)
    token = SignInToken.find_by_text record.sign_in_token
    record.errors.add :sign_in_token, 'does not exist' if token.nil?
    record.errors.add :sign_in_token, 'is outdated' if \
      token and not token.still_valid?
  end
end
