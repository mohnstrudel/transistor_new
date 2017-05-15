class Admin::ManufacturersController < ApplicationController
  
  before_action :find_manufacturer, only: [:edit, :show, :update]

  def index
    @manufacturers = Manufacturer.all
  end

  def show
  end

  def edit
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def update
    if @manufacturer.update(manufacturer_params)
      redirect_to admin_manufacturers_path
    else
      render 'edit'
    end
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)

    if @manufacturer.save
      redirect_to admin_manufacturers_path
    else
      render 'new'
    end
  end

  private

  def manufacturer_params
    params.require(:manufacturer).permit(:name, :value)
  end

  def find_manufacturer
    @manufacturer = Manufacturer.find(params[:id])
  end
end
