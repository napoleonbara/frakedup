module SessionsHelper

  def log_in user
    session_token = User.new_session_token
    cookies.permanent[:session_token] = session_token
    user.update_attribute(:session_token, User.encrypt(session_token))
    self.current_user = user
  end

  def current_user= user
    @current_user = user
  end

  def current_user
    session_token = User.encrypt(cookies[:session_token])
    @current_user ||= User.find_by(session_token: session_token)
  end

  def logged_in?
    not current_user.nil?
  end

  def admin?
    logged_in? and current_user.privilege == 'admin'
  end

  def log_out
    self.current_user = nil
    cookies.delete(:session_token)
  end
end
