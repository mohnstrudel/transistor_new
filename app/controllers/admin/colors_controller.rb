class Admin::ColorsController < ApplicationController
  
  before_action :find_color, only: [:edit, :show, :update]

  def index
    @colors = Color.all
  end

  def show
  end

  def edit
  end

  def new
    @color = Color.new
  end

  def update
    if @color.update(color_params)
      redirect_to admin_colors_path
    else
      render 'edit'
    end
  end

  def create
    @color = Color.new(color_params)

    if @color.save
      redirect_to admin_colors_path
    else
      render 'new'
    end
  end

  private

  def color_params
    params.require(:color).permit(:name, :value)
  end

  def find_color
    @color = Color.find(params[:id])
  end
end
