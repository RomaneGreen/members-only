class SessionsController < ApplicationController

  def index
  
  end

  def new

  end


  def create
    user = User.find_by(email: params[:session][:email])

      if user && user.authenticate(params[:session][:password])
        sign_in user
         flash[:success] = "You have been sucessfully signed in"
       redirect_to :root
     else
        flash[:danger] = "Invalid email/password combination"
       render 'new'
      end
  end

  def show

  end

def destroy
  current_user
     sign_out
     flash[:danger] = "User has been signed out"
     redirect_to :root
end

end
