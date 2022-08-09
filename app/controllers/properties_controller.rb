class PropertiesController < ApplicationController

  def index
   @properties = Property.all
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect to properties_path, notice: '投稿しました！'
    else
      render :new
    end
  end




  def property_params
    params.require(:property).permit(:name, :rent, :address, :year, :content)
  end

end
