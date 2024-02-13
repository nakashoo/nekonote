class Admin::PlacesController < ApplicationController
  def index
    @places = Place.page(params[:page])
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if @place.save
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
      redirect_to admin_places_path, notice: "変更しました"
    else
      render :edit
    end
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to admin_places_path
  end



  private

  def place_params
    params.require(:place).permit(:name)
  end

end
