class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_user!
    redirect_to new_session_path, notice: "Please Log in first" unless user_signed_in?
  end

  def user_signed_in?
    current_user.present?
  end
  helper_method :user_signed_in?

  def current_user
    @current_user ||= User.find_by_id session[:user_id]
  end
  helper_method :current_user

  def sign_in(user)
    session[:user_id] = user.id
  end

  def authenticate_admin!
    redirect_to root_path, notice: "You do not have the access rights to that page" unless current_user.admin
  end

  # all_tech_stacks method create to access tech stacks in home controller
  def all_tech_stacks
    @techstacks = TechStack.all
  end
  helper_method :all_tech_stacks
end
