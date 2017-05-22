class CreateProductAccessoireTags < ActiveRecord::Migration[5.0]
  def change
    create_table :product_accessoire_tags do |t|
      t.belongs_to :product, foreign_key: true
      t.belongs_to :accessoire_tag, foreign_key: true

      t.timestamps
    end
  end
end
