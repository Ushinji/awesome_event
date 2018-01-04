class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user, :authenticate

  private
  def logged_in?
    session[:user_id].present?
  end

  def logout
    session[:user_id] = nil
  end

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def authenticate
    unless logged_in?
      flash[:danger] = 'ログインをしてください'
      redirect_to root_path
    end
  end
end
