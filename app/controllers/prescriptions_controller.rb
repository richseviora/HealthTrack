class PrescriptionsController < ApplicationController
  before_filter :load_user
  before_filter :authenticate
  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @user = current_user
    @prescriptions = @user.prescriptions
    @new_prescription = @user.prescriptions.build
  end

  def create
    prescription = @user.prescriptions.build(prescription_params)
    if prescription.save
      redirect_to user_path(current_user), notice: 'Prescription added.'
    else
      flash[:now] = 'New Prescription Failed'
      render 'users/show'
    end
  end

  private
  def load_user
    @user = User.find(params[:user_id])
  end

  def handle_not_found
    redirect_to sessions_path, alert: 'Record Not Found'
  end

  def prescription_params
    params.require(:prescription).permit(:name, :date_issued)
  end

  def authenticate
    if @user != current_user
      redirect_to user_path(@user)
    end
  end
end
