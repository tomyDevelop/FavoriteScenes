class ApplicationController < ActionController::Base
  before_action :require_login, except: [:get_categories]
  before_action :get_categories

  private

  def get_categories
    @categories = Category.order(:sort_key)
  end

  def not_authenticated
    redirect_to login_path, alert: t('common.msg.not_authenticated')
  end
end
