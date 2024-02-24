class Admin::LinksController < ApplicationController
  before_action :authenticate_admin!

  def index
    @links = Link.page(params[:page])
  end

  def new
    @link = Link.new
  end

  def create
   @link = Link.new(link_params)
   if @link.save
    flash[:notice] = "正常に保存されました"
    redirect_to admin_link_path(@link)
   else
    flash.now[:alert] = '保存に失敗しました'
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
      flash[:notice] = "正常に更新されました"
      redirect_to admin_link_path(@link)
    else
      flash.now[:alert] = '更新に失敗しました。'
      render "edit"
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    flash[:notice] = "正常に削除されました"
    redirect_to admin_links_path
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end

end

