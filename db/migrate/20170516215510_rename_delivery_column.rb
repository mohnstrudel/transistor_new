class RenameDeliveryColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :deliveries, :type, :delivery_type
  end
end
