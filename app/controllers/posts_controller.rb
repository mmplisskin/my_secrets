class PostsController < ApplicationController


	def index
		@posts = Post.where(ouser_id: current_ouser.id)
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
		@post = Post.new(post_params)
		@post.ouser_id = current_ouser.id if current_ouser
		recipient=Recipient.find_or_create_by(email: params[:email])


		if @post.save
			@post.recipients << recipient
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
		if @post.update_attributes(post_params)
		  redirect_to posts_path
		else
		  render :edit
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

	private
		def post_params
		  params.require(:post).permit(:title, :description, :contact_email, :last_update, recipients_attributes: [:email, :id])

    	end
	end
