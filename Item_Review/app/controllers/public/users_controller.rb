class Public::UsersController < ApplicationController
before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(customer_params)
      redirect_to user_path(@user)
      flash[:update] = "登録情報が更新されました。"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
