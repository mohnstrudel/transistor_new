class CommentsController < ApplicationController
  
  	def create
		@product = Product.find(params[:product_id])
		respond_to do |format|
		
    		if @comment = @product.comments.create(comment_params)
    			format.html { redirect_to product_path(@product) }
    			format.js
    		else
    		end
    	end
    	# redirect_to post_path(@post)
	end

	private

	def comment_params
		params.require(:comment).permit(:title, :body, :name, :email, :picture)
	end
end
