class CreateStaticPages < ActiveRecord::Migration[5.1]
  def change
    create_table :static_pages do |t|
      t.string :title
      t.string :body
      t.string :placement

      t.timestamps
    end
  end
end
