class AddTypeToDelivery < ActiveRecord::Migration[5.0]
  def change
    add_column :deliveries, :type, :string
  end
end
