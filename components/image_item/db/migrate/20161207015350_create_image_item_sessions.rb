class CreateImageItemSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :image_item_sessions do |t|

      t.timestamps
    end
  end
end
