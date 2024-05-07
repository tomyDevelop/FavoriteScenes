class ProfilesController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.find(session[:user_id_tmp])
    @profile = @user.build_profile
    @interests = Interest.order(:sort_key)
  end

  def create
    @user = User.find(session[:user_id_tmp])
    @profile = @user.build_profile(profile_params)

    if @profile.save && interest_update
      redirect_to login_path, notice: t('profiles.form.msg.success')
      session.delete(:user_id_tmp)
    else
      @interests = Interest.order(:sort_key)
      flash.now[:alert] = t('profiles.form.msg.failed')
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @profile = @user.profile
    @interests = Interest.order(:sort_key)
    authorize @user
  end

  def update
    @user = User.find(params[:user_id])
    @profile = @user.profile
    authorize @user

    if @profile.update(profile_params) && interest_update
      redirect_to user_path(@user), notice: t('profiles.form.msg.update_success')
    else
      @interests = Interest.order(:sort_key)
      flash.now[:alert] = t('profiles.form.msg.update_failed')
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:nickname)
  end

  def interest_params
    params.require(:user).permit(interest_ids: [])
  end

  def interest_update
    cleaned_interest_ids = interest_params[:interest_ids].reject(&:blank?)

    if cleaned_interest_ids.empty?
      if @user.interests.any?
        @user.interests.clear
      else
        true
      end
    else
      @user.update(interest_ids: cleaned_interest_ids)
    end
  end
end
