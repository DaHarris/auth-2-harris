class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find(params[:user_id])
    if @user
      session[:user_id] = @user.id
      redirect_to root_path
      flash[:notice] = 'Successfully logged in.'
    else
      flash[:notice] = 'Unsuccessful log in.'
      render :new
    end
  end

end
