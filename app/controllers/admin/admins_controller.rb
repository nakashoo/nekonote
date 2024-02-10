class Admin::AdminsController < ApplicationController

  def show
    @current_admin = current_admin
    render :show
  end

  def edit
    @current_admin = current_admin
  end

  def update
     @customer = current_customer
    if @customer.update(customer_params)
      redirect_to admin_admins_my_page _path
    else
      render "edit"
    end
  end

    private

  def customer_params
    params.require(:admin).permit(:name,:responsible,:image)
  end


end
