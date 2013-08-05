class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_login(params[:session][:login])
    if user and user.authenticate(params[:session][:password])
      log_in user
      redirect_to '/contents'
    else
      flash[:error] = 'Invalid login/password'
      redirect_to root_path
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
