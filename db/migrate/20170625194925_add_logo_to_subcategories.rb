class AddLogoToSubcategories < ActiveRecord::Migration[5.1]
  def change
    add_column :subcategories, :logo, :string
  end
end
