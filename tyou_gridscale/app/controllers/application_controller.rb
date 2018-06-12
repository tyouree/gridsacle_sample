class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include ApplicationHelper

  # catch 404 route error
  rescue_from ActionController::RoutingError, with: :render_404

  # catch 500 Internal Server Error (except Invalid Authenticity Token)
  rescue_from Exception, with: :render_500 unless Rails.env.development?

  # catch Invalid Authenticity Token (500 Internal Server Error)
  rescue_from ActionController::InvalidAuthenticityToken, with: :render_408

  def render_401
    flash.now[:danger] = 'Login'
    render :file => "#{Rails.root}/app/views/login/new.html.erb" , status: 401
  end

  # 404 page redirect
  def render_404
    render :file => "#{Rails.root}/app/views/errors/404.html.erb" , status: 404
  end

  def render_408
    flash.now[:danger] = 'controllers.login.login_in'
    render :file => "#{Rails.root}/app/views/login/new.html.erb" , status: 408
  end

  # 500 Internal Server Error
  def render_500
    flash.now[:danger] = get_message("main","main","main")
    render :file => "#{Rails.root}/app/views/main_menu/main.html.erb" , status: 500
  end

end
