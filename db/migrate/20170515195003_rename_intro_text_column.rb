class RenameIntroTextColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :intro_text, :characteristics
  end
end
