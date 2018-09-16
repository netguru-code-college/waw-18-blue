class EventsController < ApplicationController
  def index
    gon.push({
      :events => event_hashes #.includes(:location)
    })

    @events = Event.all

  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end
    
  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to action: "index"
    else
      render 'new'
    end
  end

  def edit 
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to event_path
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to action: "index"
  end

  private

  def event_params
    params.require(:event).permit(:name, :start_time, :end_time, :location_id)
  end

  def event_hashes
    events = Event.includes(:location).map do |e|
      e.attributes.merge!(
        address: e.location.address, 
        latitude: e.location.latitude,
        longitude: e.location.longitude
      )
    end
  end
end
