class PostsController < ApplicationController
	require 'pry'

	def index
		@posts = Post.where(ouser_id: current_ouser.id)
		@posts = Post.all
			respond_to do |format|
	        format.html {
	            render
	        }
	        format.json {
	            render json: @posts
	        }
	  end
	end

	def new
    	@post = Post.new
			@post.recipients.build
  end

	def show
		@post = Post.find(params[:id])
			respond_to do |format|
					format.html {
							render
					}
					format.json {
							render json: @posts
					}
			end
	end

	def create
		# binding.pry
		@post = Post.new(post_params)
		@post.ouser_id = current_ouser.id if current_ouser
		#recipient=Recipient.find_or_create_by(email: params[:email])

		# Refresh recipients provided by the user
		refresh_post_recipients(@post, params['post']['emails'].split(','))

			if @post.save
				#@post.recipients << recipient
				@post.ouser_id = current_ouser.id
				redirect_to posts_path
			else
				render :new
			end
	end

	def edit
		# binding.pry
		@post = Post.find(params[:id])
		recipient=Recipient.find_or_create_by(email: params[:email])
	end

	def update

		@post = Post.find(params[:id])
		# Step 1: Delete all existing recipients
		@post.recipients.delete_all

		emails_as_array = params['post']['emails'].split(',')
		# Step 2: Add in all recipients fresh
		emails_as_array.each do |recipient|
			person = Recipient.find_or_create_by(email: recipient)
			@post.recipients << person
		end
		# Refresh recipients provided by the user


		if @post.update_attributes(post_params)
			redirect_to posts_path
			return
		end
		render :edit
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end

	private
		def post_params
		  params.require(:post).permit(:title, :description, :contact_email, :last_update, recipients_attributes: [:email])
		end

		def refresh_post_recipients(the_post, emails_as_array)
			# Step 1: Delete all existing recipients
			the_post.recipients.delete_all

			# Step 2: Add in all recipients fresh
			emails_as_array.each do |recipient|
				person = Recipient.find_or_create_by(email: recipient)
				the_post.recipients << person
			end
		end
	end
