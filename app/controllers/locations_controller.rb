class LocationsController < ApplicationController
  def index
    gon.push({
      :locations => [
        ["<b>Event 1</b><br/> Some description",52.232, 21.017],
        ["<b>Event 2</b><br/> Some description",52.233, 21.014],
        ["<b>Event 3</b><br/> Some description",52.235, 21.012],
      ]
    })
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
