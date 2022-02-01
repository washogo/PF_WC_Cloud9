class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :sidebar

  def sidebar
    @categories=Category.all
    @tags=Tag.all
  end

  def after_sign_in_path_for(resource)
    customer_path(resource)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number,:nickname]
    )
  end
end
