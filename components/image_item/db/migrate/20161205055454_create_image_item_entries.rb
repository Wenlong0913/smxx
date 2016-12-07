class CreateImageItemEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :image_item_entries do |t|
      t.integer :user_id
      t.jsonb :features

      t.timestamps
    end
  end
end
