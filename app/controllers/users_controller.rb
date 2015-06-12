class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def new
		@user = User.ner
	end
	
	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to root_path, notice: "Successfully signed up!"
		else
			render :new
		end
	end

	private 
	
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

end