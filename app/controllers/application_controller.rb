class ApplicationController < ActionController::Base
 protect_from_forgery with: :exception
  include SessionsHelper


  def sign_in(user)

cookies.permanent[:remember_token] = user.remember_token

  end
  helper_method :sign_in

  def signed_in?

  cookies[:remember_token].empty? == false

  end
helper_method :signed_in?

def validate_user
 if cookies[:remember_token].empty? == true
     flash[:danger] = "please log in to post"
   redirect_to new_session_path
 end
end

  def current_user
   @current_user ||= User.find_by(remember_token: cookies[:remember_token])
  end

   def sign_out
     cookies[:remember_token] = nil
     @current_user = nil
   end

end
