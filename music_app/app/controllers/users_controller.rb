class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in_user!(@user)
      redirect_to user_url(@user)# CHANGE LATER ???
    else
      render :new, status: 422
    end
  end

  def show
    @user = User.find(params[:id]) #use find usually with wildcard (hardcoded id)

    render :show # add stuff to view
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end