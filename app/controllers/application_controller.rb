class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user, :authenticate

  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  
  def render_404(e = nil)
    logger.info "Rendering 404 with exception: #{e.message}" if e
    render file: Rails.root.join('public/404.html'), status: 404, layout: false, content_type: 'text/html'
  end

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
