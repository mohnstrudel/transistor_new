class AddDeliveryAndPaymentToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :delivery_and_payment, :text
  end
end
