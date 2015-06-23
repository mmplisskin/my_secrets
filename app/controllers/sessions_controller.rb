class SessionsController < ApplicationController
	def new
	end

    def create
	    @ouser = Ouser.from_omniauth(request.env['omniauth.auth'])
	    session[:ouser_id] = @ouser.id
	    @ouser.last_update = Time.now
 			@ouser.save
	    flash.now[:success] = "Welcome, #{@ouser.name}!"
			UserMailer.welcome_email(@ouser).deliver
	 		redirect_to posts_path
	end

	def destroy
		session.delete(:ouser_id)
		redirect_to login_path
	end
end
