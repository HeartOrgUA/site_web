class Users::RegistrationsController < Devise::RegistrationsController

  before_action :configure_account_update_params

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :middle_name, :bio, { images: [] }])
  end

  def after_update_path_for(resource)
    edit_user_registration_path
  end
end
