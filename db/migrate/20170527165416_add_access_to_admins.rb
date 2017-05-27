class AddAccessToAdmins < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :access, :boolean
  end
end
