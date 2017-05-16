class CreateDeliveries < ActiveRecord::Migration[5.0]
  def change
    create_table :deliveries do |t|
      t.string :reach
      t.float :price

      t.timestamps
    end
  end
end
