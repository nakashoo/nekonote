class Admin::ContactsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_contact, only: [:show]

  def index
    @contacts = Contact.order(created_at: :desc).page(params[:page])
  end

  def show
    @contact = Contact.find(params[:id])
    @contact.update(admin_read: true)
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

end
