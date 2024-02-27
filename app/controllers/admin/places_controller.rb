class Admin::PlacesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @places = Place.all
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      flash[:notice] = "正常に保存されました"
      redirect_to edit_admin_place_path(@place)
    else
      @places = Place.all
      render :index
    end
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    if @place.update(place_params)
      flash[:notice] = "正常に更新されました"
      redirect_to admin_places_path
    else
      render :edit
    end
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    flash[:notice] = "正常に削除されました"
    redirect_to admin_places_path
  end

  private

  def place_params
    params.require(:place).permit(:name)
  end

end
