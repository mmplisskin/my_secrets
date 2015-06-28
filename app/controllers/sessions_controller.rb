class SessionsController < ApplicationController
	# include Sidekiq::Worker
	# after_commit :sendit, :on => :create

	def new
	end

    def create
	    @ouser = Ouser.from_omniauth(request.env['omniauth.auth'])
	    session[:ouser_id] = @ouser.id

 		if @ouser.save
			#  UserMailer.delay.welcome_email(@ouser.id)
			UserMailer.welcome_email(@ouser.id).deliver

			# if @ouser.created_at > 1.minute.ago

		end
	 		redirect_to posts_path
	end

	def destroy
		session.delete(:ouser_id)
		redirect_to login_path
	end

	def sendit
		UserMailer.delay.welcome_email(self.id)
	end
end
