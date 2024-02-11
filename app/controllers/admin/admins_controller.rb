class Admin::AdminsController < ApplicationController

  def show

  end

  def edit

  end

  def update
     @current_admin = current_admin
    if @current_admin.update(current_admin_params)
      redirect_to admin_admins_my_page_path
    else
      render "edit"
    end
  end

    private

  def current_admin_params
    params.require(:admin).permit(:name,:responsible,:image)
  end


end
