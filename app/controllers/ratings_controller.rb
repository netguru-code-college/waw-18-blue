class RatingsController < ApplicationController
  def index
    @ratings = Rating.all
  end

  def new
    @rating = Rating.new
  end

  def show
    @rating = Rating.find(params[:id])
  end

  def create
    @rating = Rating.new(rating_params)
    if @rating.save
      redirect_to action: "index"
    else
      render 'new'
    end
  end

  def edit
    @rating = Rating.find(params[:id])
  end

  def update
    @rating = Rating.find(params[:id])
    if @rating.update(rating_params)
      redirect_to rating_path
    else
      render 'edit'
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:user_id, :location_id, :rate, :desc)
  end
end
