class ChangeOptionsColumnName < ActiveRecord::Migration[5.0]
  def change
  	rename_column :options, :power, :size
  end
end
