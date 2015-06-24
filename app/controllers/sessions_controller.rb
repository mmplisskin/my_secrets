class SessionsController < ApplicationController
	def new
	end

    def create
	    @ouser = Ouser.from_omniauth(request.env['omniauth.auth'])
	    session[:ouser_id] = @ouser.id
 			@ouser.save
	    flash.now[:success] = "Welcome, #{@ouser.name}!"
			if @ouser.created_at > 1.minute.ago
				UserMailer.welcome_email(@ouser).deliver
			end
	 		redirect_to posts_path
	end

	def destroy
		session.delete(:ouser_id)
		redirect_to login_path
	end
end
