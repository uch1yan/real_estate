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
      redirect_to properties_path, notice: '投稿しました！'
    else
      render :new
    end
  end

  def show
    @property = Property.find(params[:id])
  end

  def edit
    @property = Property.find(params[:id])

  end

  def update
    @property = Property.find(params[:id])
    if @property.update(property_params)
      redirect_to properties_path, notice:'更新しました！'
    else
      render :edit
    end 
  end

  # def confirm
  #   @property = Property.new(property_params)
  #   render :new if @property.invalid?
  # end

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
    params.require(:property).permit(:name, :rent, :address, :year, :content)
  end

end
