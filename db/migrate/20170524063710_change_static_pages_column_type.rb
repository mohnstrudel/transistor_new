class ChangeStaticPagesColumnType < ActiveRecord::Migration[5.1]
  def change
    change_column :static_pages, :body, :text
  end
end
