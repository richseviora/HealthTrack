class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found
  before_action

  def show
    @user = User.find(params[:id])
    handle_not_found if @user != current_user
    @new_prescription = @user.prescriptions.build
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

  def handle_not_found
    redirect_to user_path(current_user), alert: 'User Not Found'
  end

  def user_params
    params.require(:user).permit(:name, :email, :date_of_birth, :gender, :password, :password_confirmation)
  end

  def authorize
  end
end
