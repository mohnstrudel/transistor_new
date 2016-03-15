class AddSeoFieldsToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :keywords, :string, default: ""
    add_column :settings, :description, :text, default: ""
    add_column :settings, :title, :string, default: ""
  end
end
