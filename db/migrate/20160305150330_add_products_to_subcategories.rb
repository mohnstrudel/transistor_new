class AddProductsToSubcategories < ActiveRecord::Migration
  def change
    add_reference :subcategories, :product, index: true, foreign_key: true
  end
end
