class Category < ActiveRecord::Base
	has_many :products
	has_many :subcategories

	mount_uploader :vertical_image, CategorypicUploader
end
