class Public::ContactsController < ApplicationController

  def index
    @contacts = current_customer.contacts.page(params[:page])
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.customer = current_customer
      if @contact.save
        redirect_to contact_thanks_path(@contact)
      else
        render 'show'
      end
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def thanks
  end


  private

  def contact_params
    params.require(:contact).permit(:title,:body,:customer_id)
  end




end
