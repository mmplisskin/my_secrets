module SessionsHelper
	def current_user
		@current_user ||= Ouser.find_by(id: session[:ouser_id])
	end
end
