class SessionsController < ApplicationController
	def new
	end

    def create
	    @ouser = Ouser.from_omniauth(request.env['omniauth.auth'])
	    session[:ouser_id] = @ouser.id
			UserMailer.delay.welcome_email(@ouser.id)
 		if @ouser.save
			# if @ouser.created_at > 1.minute.ago

			end
	 		redirect_to posts_path
	end

	def destroy
		session.delete(:ouser_id)
		redirect_to login_path
	end
end
