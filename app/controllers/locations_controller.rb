class LocationsController < ApplicationController
  def index
    @locations = Location.all.order("created_at DESC")
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
      redirect_to @location
    else
      render 'edit'
    end
  end

  def edit 
    @location = Location.find(params[:id])
  end

  def destroy
    @Location = Location.find(params[:id])
    @location.destroy

    redirect_to location_path
  end

  private

  def location_params
    params.require(:location).permit(:name, :type, :is_przypal, :address)
  end
end
