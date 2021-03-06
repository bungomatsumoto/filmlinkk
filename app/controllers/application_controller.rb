class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_client!
  # before_action :authenticate_right_holder!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    if resource_class == Client
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :screen_name, :country, :city, :intro, :icon, :icon_cache])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :screen_name, :country, :city, :intro, :icon, :icon_cache])
    elsif resource_class == RightHolder
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :intro, :icon, :icon_cache])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :intro, :icon, :icon_cache])
    else
      super
    end
  end

  private

  def after_sign_in_path_for(resource)
    # if current_client || current_right_holder
      flash[:notice] = "ログインに成功しました"
      films_path
    # else
    #   flash[:notice] = "新規登録完了しました。"
    # end
  end
end
