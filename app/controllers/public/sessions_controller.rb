 #サークル員用 login コントローラー

class Public::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  def after_sign_in_path_for(resource)
     customers_my_page_path
  end

  def after_sign_out_path_for(resource)
     new_customer_session_path
  end

  protected

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end
end
