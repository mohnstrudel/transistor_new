class AddColorandsizeToLineItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :line_items, :color, foreign_key: true
    add_reference :line_items, :size, foreign_key: true
  end
end
