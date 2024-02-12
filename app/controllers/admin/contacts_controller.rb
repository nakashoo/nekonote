class Admin::ContactsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_contact, only: [:show]

  def index
    @contacts = Contact.page(params[:page])
  end

  def show
    @contact = Contact.find(params[:id])
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

end
