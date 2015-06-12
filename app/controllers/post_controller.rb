class PostController < ApplicationController
  
	  def new
	    @post = Post.new
	  end  
	  
	  def index
	    @posts = Post.all
	  end
	  
	  def show
	    @post = Post.find(params[:id])
	  end
	  
	  def create
	    @post = Post.new(post_params)
	    if post.save
	      redirect_to posts_path
	    else
	      render :new  
	    end  
	  end  
	  
	  def edit
	    @post = Post.find(params[:id])
	  end
	  
	  def update
	    @post = Post.find(post_params[:id])
	    if post.update_attributes(post_params)
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
		  params.require(:post).require(:title, :description, :contact_email)
		end
	end
end