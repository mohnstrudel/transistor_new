class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :title
      t.string :name
      t.string :email
      t.text :body
      t.belongs_to :product, foreign_key: true

      t.timestamps
    end
  end
end
