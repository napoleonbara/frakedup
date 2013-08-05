module SessionsHelper

  def log_in user
    cookies[:user] = user.id
    self.current_user = user
  end

  def current_user= user
    @current_user = user
  end

  def current_user
    @current_user ||= User.find(cookies[:user])
  end

  def logged_in?
    not current_user.nil?
  end

  def log_out
    self.current_user = nil
    cookies.delete(:user)
  end
end
