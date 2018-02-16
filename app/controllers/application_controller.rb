class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, only: :home

  def home
  end

  def welcome
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_user!
    redirect_to login_path if !logged_in?
  end

  def redirect_home
    redirect_to home_path if logged_in?
  end

  helper_method :current_user

end
