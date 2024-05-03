class ApplicationController < ActionController::Base
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :require_login, except: [:get_categories]
  before_action :get_categories

  private

  def get_categories
    @categories = Category.order(:sort_key)
  end

  def not_authenticated
    redirect_to login_path, alert: t('common.msg.not_authenticated')
  end

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore

    redirect_back(fallback_location: root_path, alert: t("#{policy_name}.#{exception.query}", scope: "pundit", default: :default))
  end
end
