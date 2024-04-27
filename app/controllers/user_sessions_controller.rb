class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end
  
  def create
    @user = login(params[:account_name], params[:password])

    if @user
      redirect_to(root_path, notice: t('user_sessions.form.msg.login_success'))
    else
      flash.now[:alert] = t 'user_sessions.form.msg.login_failed'
      render :new, status: :see_other
    end
  end

  def destroy
    logout
    redirect_to(root_path, notice: t('user_sessions.form.msg.logout', status: :see_other))
  end
end
