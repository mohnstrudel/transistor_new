class RenameColorsToManufacturers < ActiveRecord::Migration[5.0]
  def change
    rename_table :colors, :manufacturers
  end
end
