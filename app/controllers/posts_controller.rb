class PostsController < ApplicationController
	def index
		@posts = Post.all
    end


   def show
   	@post = Post.find(params[:id])
   end

  def update
  	@post = Post.find(params[:id])
  	if @post.update
  		flash[:notice] = "Your post has been updated."
  	else
  		flash[:notice] = "Your post has an error, can not update."	
  end
  	redirect_to :back
  end
  def destroy
    @post = Post.fine(params[:id])
    if @post.destroy 
    	flash[:notice] = "User deleted successfully,"
    else
    	flash[:notice] = "There was a problem deleting the user"
  end	
  	redirect_to :back
    end
end  