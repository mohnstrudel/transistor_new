class Admin::SubcategoriesController < ApplicationController
  
  before_action :find_subcategory, only: [:edit, :show, :update, :destroy]

  def index
    @subcategories = Subcategory.all
  end

  def show
  end

  def edit
  end

  def destroy
    if @subcategory.destroy
      redirect_to admin_subcategories_path
    else
      render :index
    end
  end

  def new
    @subcategory = Subcategory.new
  end

  def update
    if @subcategory.update(subcategory_params)
      redirect_to admin_subcategories_path
    else
      render 'edit'
    end
  end

  def create
    @subcategory = Subcategory.new(subcategory_params)

    if @subcategory.save
      redirect_to admin_subcategories_path
    else
      render 'new'
    end
  end

  private

  def subcategory_params
    params.require(:subcategory).permit(:name, :category_id, :vertical_image, :remove_vertical_image, :description)
  end

  def find_subcategory
    @subcategory = Subcategory.find(params[:id])
  end
end
