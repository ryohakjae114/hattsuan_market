class PaymentInformationsController < ApplicationController
  before_action :set_user, only: %i[edit update]

  def edit
  end

  def update
    if @user.update(user_payment_information_params)
      redirect_to root_path, notice: t('controller.updated'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_payment_information_params
    params.require(:user).permit(:name, :address)
  end
end
