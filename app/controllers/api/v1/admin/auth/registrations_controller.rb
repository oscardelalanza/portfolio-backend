class Api::V1::Admin::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  include Registrations

  before_action :register_allowed?, only: [:create]
end
