 #運営用 login コントローラー
class Admin::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  def after_sign_in_path_for(resource)
     admin_admins_my_page_path
  end

  def after_sign_out_path_for(resource)
     new_admin_session_path
  end

  # 運営ゲスト用
  def guest_sign_in
    admin = Admin.guest
    sign_in admin
    redirect_to admin_admins_my_page_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  protected

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end
end
