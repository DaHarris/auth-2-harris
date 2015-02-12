class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find(params[:user_id])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, :notice => 'Successfully logged in.'
    else
      redirect_to new_user_path, :notice => 'Unsuccessful log in.'
    end
  end

  def destroy
    session.clear
    redirect_to root_path, :notice => 'Logged out.'
  end

end
