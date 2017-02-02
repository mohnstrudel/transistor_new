class LineItemsController < ApplicationController
	include CurrentCart
	before_action :set_cart, only: [:create]
	before_action :set_line_item, only: [:show, :edit, :update, :destroy]

	def create
		product = Product.find(params[:product_id])
		size_array = eval(params[:size][0])

		size_id = size_array[0]
		size_price = size_array[1]
		@line_item = @cart.add_product(product.id, params[:color_id].to_i, size_id)

		@line_item.sellprice = size_price


		respond_to do |format|
			if @line_item.save
				format.html { redirect_to @line_item.cart, notice: 'Line item was successfully created.' }
				format.json { render action: 'show', status: :created,  location: @line_item }
				format.js {}
			else
				format.js {}
				format.html { render action: 'new' }
				format.json { render json: @line_item.errors, status: :unprocessable_entity }
			end
		end
	end

	private

		# Use callbacks to share common setup or constraints between actions.
	    def set_line_item
	      @line_item = LineItem.find(params[:id])
	    end

	    # Never trust parameters from the scary internet, only allow the white list through.
	    def line_item_params
	      params.require(:line_item).permit(:product_id, :cart_id, :quantity, :sellprice, :color_id, :size_id)
	    end
end
