class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def show
    @location = Location.find(params[:id])
  end

  def create
    @location = Location.new(location_params)

    if @location.save
        redirect_to action: "index"
    else
      render 'new'
    end
  end

  def update
    @location = Location.find(params[:id])

    if @location.update(location_params)
      redirect_to location_path
    else
      render 'edit'
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    redirect_to action: "index"
  end

  private

  def location_params
    params.require(:location).permit(:name, :location_type, :is_przypal, :address)
  end
end
