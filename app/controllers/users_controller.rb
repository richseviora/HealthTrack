class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      flash.now[:error] = 'User could not be created.'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :date_of_birth, :gender, :password, :password_confirmation)
  end
end
