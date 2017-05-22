class ProductsController < ApplicationController
 
  before_action :find_product, only: [:show]

  def index

    

  	if params[:category].blank?
      @products = Product.sizing(params[:product][:sizing])
      # @products = Product.filter(params.slice(:voltage))
      # debug
      # @products = Product.all.order(params[:sort], created_at: :desc)
    elsif params[:subcategory].blank?
      @category = Category.find_by(name: params[:category])
      @category_id = @category.id
      if params[:sort]
        @products = Product.where(category_id: @category_id).order(params[:sort, created_at: :desc])
      else
        @products = Product.where(category_id: @category_id).order(params[created_at: :desc])
      end

    else

      @category = Category.find_by(name: params[:category])
      @category_id = @category.id
      @subcategory = Subcategory.find_by(name: params[:subcategory])
      @subcategory_id = @subcategory.id

      if params[:sort]
        @products = Product.where(category_id: @category_id).where(subcategory_id: @subcategory_id).order(params[:sort, created_at: :desc])
      else
        @products = Product.where(category_id: @category_id).where(subcategory_id: @subcategory_id).order(params[created_at: :desc])
      end

    end 
  end

  def show
    # @similar_products = @product.tags.map(&:products).flatten.uniq - [@product]
    @similar_products = Product.joins(:tags).where('tags.id' => @product.tag_ids).where.not('products.id' => @product.id).uniq

    @accessoires = Product.joins(:accessoire_tags).where('accessoire_tags.id' => @product.accessoire_tag_ids).where.not('products.id' => @product.id).uniq
    # @similar_products = Product.joins(:tags).where("tags.id IN (?)", @product)
  end

  private

  def find_product
  	@product = Product.find(params[:id])
  end
end
