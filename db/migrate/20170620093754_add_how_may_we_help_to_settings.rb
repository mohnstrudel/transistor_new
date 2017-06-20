class AddHowMayWeHelpToSettings < ActiveRecord::Migration[5.1]
  def change
    add_column :settings, :how_may_we_help, :text
  end
end
