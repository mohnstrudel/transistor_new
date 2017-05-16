class CreateProductDeliveries < ActiveRecord::Migration[5.0]
  def change
    create_table :product_deliveries do |t|
      t.belongs_to :product, foreign_key: true
      t.belongs_to :delivery, foreign_key: true

      t.timestamps
    end
  end
end
