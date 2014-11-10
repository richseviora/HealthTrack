class PrescriptionsController < ApplicationController
  before_filter :load_user
  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def create
    prescription = @user.prescriptions.build(prescription_params)
    if prescription.save
      redirect_to user_path(@user), notice: 'Prescription added.'
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
    redirect_to session_path, alert: 'Record Not Found'
  end

  def prescription_params
    params.require(:prescription).permit(:name, :date_issued)
  end
end
