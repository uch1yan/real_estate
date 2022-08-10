class PropertiesController < ApplicationController

  def index
   @properties = Property.all
  end

  def new
    @property = Property.new
    2.times { @property.nearest_stations.new }
  end

  def create
    @property = Property.new(property_params)
    @property.nearest_stations.build
    if @property.save
      redirect_to @property, notice: '投稿しました！'
    else
      render :new
    end
  end

  def show
    @property = Property.find(params[:id])
    @nearest_stations = @property.nearest_stations
  end

  def edit
    @property = Property.find(params[:id])
    @property.nearest_stations.new
  end

  def update
    @property = Property.find(params[:id])
    if @property.update(property_params)
      redirect_to @property, notice:'更新しました！'
    else
      render :edit
    end
  end

  def destroy
    @property = Property.find(params[:id])
    if @property.destroy
      redirect_to properties_path, notice: "投稿を削除しました！"
    else
      render :index
    end
  end




  private

  def property_params
    params.require(:property).permit(:name, :rent, :address, :year, :content,
      nearest_stations_attributes: [:train_line, :station_name, :on_foot, :prorerty_id, :id, :_destroy])
  end

end
