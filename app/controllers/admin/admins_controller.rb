class Admin::AdminsController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_guest_user, only: [:edit]

  def show

  end

  def edit

  end

  def update
     @current_admin = current_admin
    if @current_admin.update(current_admin_params)
      flash[:notice] = "正常に更新されました"
      redirect_to admin_admins_my_page_path
    else
      flash.now[:alert] = '更新に失敗しました。'
      render "edit"
    end
  end

    private

  def current_admin_params
    params.require(:admin).permit(:name,:responsible,:image)
  end

  def ensure_guest_user
    @current_admin  = current_admin
    if current_admin.email == "admin@example.com"
      redirect_to admin_admins_my_page_path
    end
  end



end

