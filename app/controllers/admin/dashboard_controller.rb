class Admin::DashboardController < AdminController
  def index	
	@products = Product.last(5)
	@categories = Category.last(5)
	@subcategories = Subcategory.last(5)
	@sizes = Size.last(5)
	@tags = Tag.last(5)
	@manufacturers = Manufacturer.last(5)
	@setting = Setting.first
  end
end
