class LineItemsController < ApplicationController
	include CurrentCart
	before_action :set_cart, only: [:create]
	before_action :set_line_item, only: [:show, :edit, :update, :destroy]

	def create
		product = Product.find(params[:product_id])
		@line_item = @cart.add_product(product.id)

		@line_item.sellprice = params[:voltage][0]


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
	      params.require(:line_item).permit(:product_id, :cart_id, :quantity, :sellprice)
	    end
end
