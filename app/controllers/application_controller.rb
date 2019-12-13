class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    if resource_class == Client
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :screen_name, :country, :city, :intro, :icon])
    elsif resource_class == RightHolder
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :intro, :icon])
    else
      super
    end
  end
end
