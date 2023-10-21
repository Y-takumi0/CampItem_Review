class Admin::UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @users = User.find(params[:id])
  end

  def edit
    @users = User.find(params[:id])
  end

  def update
    @users = User.find(params[:id])
    if @users.update(users_params)
      redirect_to admin_users_path(@users), notice: "ユーザー情報を更新しました。"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:users).permit(:name, :profile, :email, :is_active, :image)
  end
end
