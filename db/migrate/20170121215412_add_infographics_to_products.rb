class AddInfographicsToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :main_infographic, :string
    add_column :products, :sizes_infographic, :string
    add_column :products, :table_infographic, :string
  end
end
