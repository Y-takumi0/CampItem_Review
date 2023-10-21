class Public::UsersController < ApplicationController
before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(customer_params)
      redirect_to user_path(@userr)
      flash[:update] = "登録情報が更新されました。"
    else
      render :edit
    end
  end
end
