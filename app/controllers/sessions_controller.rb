class SessionsController < ApplicationController
	def new
	end

  # def create
  # 	user = User.find_by(email: params[:login][:email])

		# if user && user.authenticate(params[:login][:password])
		# 	session[:user_id] = user.id.to_s
		# 	redirect_to root_path
		# 	# notice: "Successfully logged in!"
		# else
		# 	render :new
		# end
  # end
    def create
	    @ouser = Ouser.from_omniauth(request.env['omniauth.auth'])
	    session[:ouser_id] = @ouser.id
	    flash[:success] = "Welcome, #{@ouser.name}!"
			UserMailer.welcome_email(@ouser).deliver

	 	redirect_to root_path
	end

	def destroy
		session.delete(:ouser_id)
		redirect_to login_path
	end
end
