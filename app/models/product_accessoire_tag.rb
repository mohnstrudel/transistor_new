class ProductAccessoireTag < ApplicationRecord
  belongs_to :product
  belongs_to :accessoire_tag
end
