class UserSessionsController < ApplicationController
  def new
  end
  
  def create
    @user = login(params[:account_name], params[:password])

    if @user
      redirect_back_or_to(root_path, notice: 'Login successful')
    else
      redirect_back_or_to(root_path, notice: 'Login Failed')
    end
  end

  def destroy
    logout
    redirect_to(root_path, notice: 'Logged out!', status: :see_other)
  end
end
