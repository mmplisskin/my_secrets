class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
include SessionsHelper

  # def authorized?
  #     redirect_to root_path unless current_user
  #
  # end
  protect_from_forgery with: :exception
end
