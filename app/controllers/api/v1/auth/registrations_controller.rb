class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  before_action :one_user_registered?, only: [:create]

  protected

  def one_user_registered?
    render_error(:forbidden, I18n.t('errors.forbidden')) if User.count >= 1
  end
end
