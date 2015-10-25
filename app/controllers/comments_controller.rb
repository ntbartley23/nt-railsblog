class CommentsController < ApplicationController
	def new 
		@comment = Comment.new
    end


   def create 
   	@comment = Comment.new(user_params)
   end

 def edit
   	@comment = Comment.find(params[:id])
   end

   def update
   	@comment = Comment.find(params[:id])
   	respond_to do |format|
   		if @comment.update(comment_params)
   			format.html { redirect_to @user, notice: 'Comment updated.'}
   			format.json { render :show, status: :ok, location: @post }
   		else
   			format.html { render :edit }	
   			format.json { render json: @comment.errors, status: :unprocessable_entity }
		end   
   end 
 end

   def destroy
   	@comment = Comment.find(params[:id])
   	 if @comment.destroy
   	 	flash[:notice] = "Comment deleted successfully"
   	 else
   	 	flash[:alert] = "There was an problem deleting this comment"	
   end
   private

  def whitelisted_params
    # only the attributes of an individual comment which are permitted here are allowed to save to the comment
    params.require(:comment).permit(:comment_body, :post_id)
  end	
end  