class SessionsController < ApplicationController
	# include Sidekiq::Worker
	# after_commit :sendit, :on => :create
	require "active_model_otp"
	extend ActiveModel::Callbacks
	include ActiveModel::Validations
	include ActiveModel::OneTimePassword


require 'pry'
	def new
	end

    def create
	    @ouser = Ouser.from_omniauth(request.env['omniauth.auth'])
	    # session[:ouser_id] = @ouser.id
			@ouser.otp_code
			UserMailer.delay.otp_email(@ouser.id, @ouser.otp_code )
			# binding.pry
			redirect_to otp_path(@ouser.id)



 		if @ouser.save
			if @ouser.created_at > 1.minute.ago
			 	UserMailer.delay.welcome_email(@ouser.id)
			# UserMailer.welcome_email(@ouser.id).deliver
			end
		end

		rescue
			flash[:notice] = "Please select the provider that you already have an account with ( i.e. if you chose Facebook use your Google account. )"
			redirect_to root_path
	end

	def destroy
		session.delete(:ouser_id)
		redirect_to login_path
	end

	def otp
	end

	def otpcreate
		@ouser = Ouser.find(params[:id])
		@token = (params[:token])

		if @ouser.authenticate_otp(@token)
			  session[:ouser_id] = @ouser.id
				redirect_to posts_path
		else
			flash[:notice] = "Please double check the passcode"
			redirect_to otp_path
		end

	end

end
