class SessionsController < ApplicationController
  def new
  end

  def create
   @user = User.find_by_email(params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: 'User Logged In'
    else
      flash.now[:error] = 'Invalid Username/Password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_sessions_path, notice: 'Logged Out'
  end
end
