class ChangeColumnTypeForSizes < ActiveRecord::Migration[5.0]
  def change
  	change_column :options, :size, :string
  end
end
