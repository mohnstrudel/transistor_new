class RenamePowersToSizes < ActiveRecord::Migration[5.0]
  def change
  	rename_table :powers, :sizes
  end
end
