class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  	protect_from_forgery with: :exception

private

	def current_ouser
  		@current_ouser ||= Ouser.find_by(id: session[:ouser_id])
	end
	def authorized?
  		redirect_to root_path unless current_ouser
  	end
	helper_method :current_ouser
end
