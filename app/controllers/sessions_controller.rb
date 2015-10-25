class SessionsController < ApplicationController
   #define new user
  def new
    @user = User.new
  end
    #create new user
    def create
      username = params[:username]
      password = params[:password]

      #finds the user
      @user = User.where(username: username).first
        #if they put in wrong user
      if @user.nil?
        flash[:alert] = "Not a user"
          redirect_to :back

        #if password and user name are correct a new session will be made!
      else
        if @user.password == password
          session[:user_id] = @user.id
          redirect_to posts_path

        else
          redirect_to profile_path
      end
    end
  end
  #when person clicks on log out.. the session is destroyed

  def destroy
      session[:user_id] = nil
      redirect_to  :back
    end

end