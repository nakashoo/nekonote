class Public::LinksController < ApplicationController
  def index
    @links = Link.page(params[:page])
  end
end
