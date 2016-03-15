class AddSiteToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :site, :string
  end
end
