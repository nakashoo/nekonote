 #サークル員用 signin コントローラー

class Public::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  def after_sign_up_path_for(resource)
     customers_my_page_path
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email,:responsible])
  end


end
