class NearestStationsController < ApplicationController

  def index
    @nearest_stations = NearestStation.all
  end

  def show
    @nearest_station = NearestStation.find(params[:id])
  end

  def new
    @nearest_station = NearestStation.new
  end

  def edit
    @nearest_station = NearestStation.find(params[:id])
  end

  def create
    @nearest_station = NearestStation.new(nearest_station_params)

    if @nearest_station.save
      redirect_to @nearest_station, notice: 'Successfully created!'
    else
      render :new
    end
  end

  def update
    if @nearest_station.update(nearest_station_params)
      redirect_to @nearest_station, notice: 'Successfully updated!'
    else
      render :edit
    end
  end 


  private

  def nearest_station_params
    params.require(:nearest_station).permit(:train_line, :station_name, :on_foot, :property_id, :id)
  end

end
