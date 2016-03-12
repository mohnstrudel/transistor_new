class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :logo
      t.text :adv_text_1
      t.text :adv_text_2
      t.text :adv_text_3
      t.text :about
      t.string :phone1
      t.string :phone2
      t.string :mail
      t.string :opening
      t.hstore :social_media

      t.timestamps null: false
    end
    add_index :settings, :social_media, using: :gist
  end
end
