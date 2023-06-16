class ApplicationController < ActionController::Base

  helper_method :logged_in?
  before_action :set_recipes
  def set_recipes
    @recipes_new = Recipe.last(3).reverse
  end

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  private

  def logged_in?
    session[:user_id].present?
  end

end


