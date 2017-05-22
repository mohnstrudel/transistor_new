class AccessoireTag < ApplicationRecord
  has_many :products, through: :product_accessoire_tags
end
