class Admin::UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @review = @user.reviews
  end

  def follows
    @user = User.find(params[:id])
    @users = @user.followings
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
  end

  def update
    @users = User.find(params[:id])
    if @users.update(user_params)
      redirect_to admin_users_path(@users), notice: "ユーザー情報を更新しました。"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile, :email, :is_active, :image)
  end
end
