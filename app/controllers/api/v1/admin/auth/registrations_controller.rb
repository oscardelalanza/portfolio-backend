class Api::V1::Admin::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  before_action :one_user_registered?, only: [:create]
  skip_before_action :authenticate_user!

  protected

  def one_user_registered?
    render_error(:forbidden, I18n.t('errors.forbidden')) if User.count >= 1
  end
end
