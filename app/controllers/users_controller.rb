class UsersController < ApplicationController
	def index
		@users = User.all
		location = request.safe_location
		@longitude = location.data['longitude']
		@latitude = location.data['latitude']
	end




	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			UserMailer.welcome(@user).deliver
			redirect_to root_path
		else
			render :new
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

end
