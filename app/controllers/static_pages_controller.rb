class StaticPagesController < ApplicationController
  
  before_action :certify_logged_in, only: [:contents]
  before_action :certify_admin, only: [:administration]

  def home
    redirect_to contents_path if logged_in?
  end

  def contents
    
  end

  def welcome
    not_found unless flash[:account_just_created]
  end

  def administration
    @sign_in_token = SignInToken.new
    @sign_in_tokens = SignInToken.all
    @users = User.all
  end

end
