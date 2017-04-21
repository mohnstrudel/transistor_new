class Category < ActiveRecord::Base
	has_many :products
	has_many :subcategories, dependent: :destroy

	mount_uploader :vertical_image, CategorypicUploader
end
