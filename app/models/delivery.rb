class Delivery < ApplicationRecord

  has_many :product_deliveries
  has_many :products, through: :product_deliveries
end
