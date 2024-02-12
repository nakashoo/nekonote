class Public::CustomersController < ApplicationController
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

end
