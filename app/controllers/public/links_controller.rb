class Public::LinksController < ApplicationController
  def index
    @links = Link.order(created_at: :desc).page(params[:page])
  end
end
