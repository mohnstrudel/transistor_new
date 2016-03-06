class Tag < ActiveRecord::Base
	has_many :products, through: :product_tags
end
