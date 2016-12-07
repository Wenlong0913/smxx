class CreateImageItemEntriesResources < ActiveRecord::Migration[5.0]
  def change
    create_table :image_item_entries_resources do |t|
      t.references :image_item_entry, foreign_key: true
      t.references :resource, polymorphic: true, index: {:name => "index_entry_resource_on_resource"}

      t.timestamps
    end
  end
end
