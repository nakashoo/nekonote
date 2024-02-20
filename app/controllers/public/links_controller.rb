class Public::LinksController < ApplicationController
  before_action :authenticate_customer!

  def index
    @links = Link.order(created_at: :desc).page(params[:page])
  end
end
