require 'securerandom'
require 'date'

class SignInToken < ActiveRecord::Base

  TOKEN_SIZE = 10
  VALIDITY_PERIOD = 2.weeks

  validates :text,
    presence: true,
    uniqueness: true

  before_validation :set_token, on: :create

  def still_valid?
    self.created_at + VALIDITY_PERIOD > Time.zone.now 
    #(Date.today - Date.new(self.created_at)) < TOKEN_VALIDITY_PERIOD
  end

  protected
  def set_token
    self.text = SecureRandom.urlsafe_base64(TOKEN_SIZE).gsub(/[^A-Za-z0-9]/,'')
  end
end

