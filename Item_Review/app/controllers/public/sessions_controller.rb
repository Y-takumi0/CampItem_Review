# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :user_state, only: [:create]

  # GET /resource/sign_in
  #def new
  #  super
  #end

  # POST /resource/sign_in
  #def create
  #  super
  #end

  # DELETE /resource/sign_out
  #def destroy
  #  super
  #SSend


  def user_state
    @user = User.find_by(email: params[:user][:email])
    if @user
      if (@user.valid_password?(params[:user][:password]) && (@user.is_active? == false))
          flash[:error] = "申し訳ございません。こちらのユーザーは制限させていただいてます。"
          redirect_to new_user_session_path
      else
      end
    end
  end


  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  protected
    def after_sign_in_path_for(resource)
      user_path(current_user.id)
    end

    def after_sign_out_path_for(resource)
      new_user_session_path
    end
end
