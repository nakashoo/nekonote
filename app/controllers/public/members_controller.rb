class Public::MembersController < ApplicationController
  def index
    @admins = Admin.all
    @customers = Customer.all
  end
end
