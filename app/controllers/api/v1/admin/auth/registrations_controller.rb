class Api::V1::Admin::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  before_action :one_user_registered?, only: [:create]
  before_action :configure_permitted_parameters

  protected

  def one_user_registered?
    render_error(:forbidden, I18n.t('errors.forbidden')) if User.count >= 1
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name nickname])
  end
end
