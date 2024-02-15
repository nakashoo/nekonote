class Admin::LinksController < ApplicationController

  def index
    @links = Link.page(params[:page])
  end

  def new
    @link = Link.new
  end

  def create
   @link = Link.new(link_params)
   if @link.save
    redirect_to admin_links_path
   else
    index
    render 'new'
   end
  end

  def show
    @link = Link.find(params[:id])
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      redirect_to admin_links_path
    else
      render "edit"
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    redirect_to admin_links_path
  end

  private

  def link_params
    params.require(:link).permit(:title, :url, :admin_id)
  end

end

