class SessionsController < ApplicationController

  def new
    debugger
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:email],
      params[:password]
      )
      debugger
      
      if user.save
        log_in_user!(user)
        redirect_to user_url(user)
      else  
        render :new, status: 401
      end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil #user.session_token = nil 
    redirect_to new_user_url #ADD IN MUSIC#INDEX HOME PAGE LATER
  end

end