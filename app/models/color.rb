class Color < ApplicationRecord

	has_many :coloralizations
	has_many :products, through: :coloralizations

end
