class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  before_action :one_user_registered?, only: [:create]

  protected

  def one_user_registered?
    render_error(:forbidden, 'Method not allowed') if User.count >= 1 # TODO: implement i18n translations
  end
end
