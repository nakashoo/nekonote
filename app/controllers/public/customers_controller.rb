class Public::CustomersController < ApplicationController
 before_action :authenticate_customer!
 before_action :ensure_guest_user, only: [:edit]

  def show
  end

  def edit
  end

  def update
    @current_customer = current_customer
   if @current_customer.update(current_customer_params)
     redirect_to customers_my_page_path
   else
     render "edit"
   end
  end

    private

  def current_customer_params
    params.require(:customer).permit(:name,:member_ship_year,:image)
  end

  def ensure_guest_user
    @current_customer = current_customer
    if current_customer.email == "guest@example.com"
      redirect_to customers_my_page_path
    end
  end

end
