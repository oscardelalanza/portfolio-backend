module Registrations
  extend ActiveSupport::Concern

  protected

  def register_allowed?
    render_error(:forbidden, I18n.t('errors.forbidden')) if users_limit_reached?
  end

  def users_limit_reached?
    return true if User.count >= ENV.fetch('ADMIN_USERS_ALLOWED', 1).to_i

    false
  end
end
