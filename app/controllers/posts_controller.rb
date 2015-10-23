class PostsController < ApplicationController
	def index
		@posts = Post.all
    end


   def show
   	@post = Post.find(params[:id])
   end

  def update
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