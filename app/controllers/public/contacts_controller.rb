class Public::ContactsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_contact, only: [:show]

  def index
    @contacts = current_customer.contacts.order(created_at: :desc).page(params[:page])
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.customer = current_customer
    @contact.body = params[:contact][:body]
      if @contact.save
        flash[:notice] = "正常に保存されました"
        redirect_to contact_thanks_path(@contact)
      else
        flash.now[:alert] = '保存に失敗しました'
        render 'new'
      end
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def thanks
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    flash[:notice] = "正常に削除されました"
    redirect_to contacts_path
  end

  private

  def set_contact
    @contact = current_customer.contacts.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:title,:body,:customer_id)
  end

end
