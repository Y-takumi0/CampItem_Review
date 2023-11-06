class Public::UsersController < ApplicationController
before_action :authenticate_user!
before_action :ensure_guest_user, only: [:edit]

  def show
    @user = User.find(params[:id])
    @review = @user.reviews
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user)
      flash[:update] = "登録情報が更新されました。"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :plofile, :image)
  end

  def ensure_guest_user
   if current_user.guest_user?
     redirect_to user_path(current_user), notice: "ゲストユーザーはプロフィール編集できません。"
   end
  end
end
