class PostsController < ApplicationController


	def index
		@posts = Post.all
	end

    def new
      @post = Post.new
			@post.recipients.build

    end

	# def new
  #   @post = Post.new
  #   post_recipients = @post.post_recipients.build
  #   post_recipients.recipients.build
	# end


	def show
		@post = Post.find(params[:id])

	end

	def create


		@post = Post.new(post_params)
		# @post.user = current_user
		# @post.recipientsc(params[:email])

	if @post.save
			@post.recipients.create(email: params[:email])
			redirect_to posts_path
		else
			render :new
		end
	end

	def edit
		@post = Post.find(params[:id])
		# @email= Recipient.find(@post.id)
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
		  params.require(:post).permit(:title, :description, :contact_email, :last_update, recipients_attributes: [:email])

    	end
	end
