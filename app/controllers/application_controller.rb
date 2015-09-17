class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user_session, :current_user, :require_user, :require_no_user

  def store_location
    session[:return_to] = request.original_url
  end
  
  def redirect_back_or_default(default = root_path)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
  
private

  def current_user_session
    return @current_user if defined?(@current_user_sesssion)
    @current_user_session = ::UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def require_user
    unless current_user
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to login_path
      return false
    end
  end

  def require_no_user
    if current_user
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to root_path
      return false
    end
  end
  
end