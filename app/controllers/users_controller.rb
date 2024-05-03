class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id_tmp] = @user.id
      redirect_to new_user_profile_path(@user.id), notice: t('users.form.msg.success')
    else
      # redirect_to new_user_path, alert: t('users.form.msg.failed')
      flash.now[:alert] = t('users.form.msg.failed')
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:account_name, :password, :password_confirmation)
  end
end
