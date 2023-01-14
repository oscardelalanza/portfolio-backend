class Api::V1::Admin::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  before_action :one_user_registered?, only: [:create]

  protected

  def one_user_registered?
    render_error(:forbidden, I18n.t('errors.forbidden')) unless registrable?
  end

  private

  def registrable?
    return if User.count >= ENV.fetch('ADMIN_USERS_ALLOWED', 1).to_i

    true
  end
end
