class Product < ActiveRecord::Base

	scope :hot, lambda{ where(hotproduct: true) }

	mount_uploader :main_slider_image, CategorypicUploader

	belongs_to :category
	belongs_to	:subcategory
	
	has_many :options, dependent: :destroy
	accepts_nested_attributes_for :options, allow_destroy: true

	has_many :images
	accepts_nested_attributes_for :images, allow_destroy: true

	has_many :line_items

	before_destroy :ensure_not_referenced_by_any_line_item


	private 

	def ensure_not_referenced_by_any_line_item
		if line_items.empty?
			return true
		else
			errors.add(:base, 'Line Items present')
			return false
		end
	end
end
