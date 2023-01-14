class Api::V1::Admin::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  include Api::V1::Admin::Auth::Registrations

  before_action :one_user_registered?, only: [:create]
end
