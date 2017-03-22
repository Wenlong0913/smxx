class CreateShops < ActiveRecord::Migration[5.0]
  def change
    create_table :shops do |t|
      t.references :user, foreign_key: true
      t.string :name, null: false
      t.string :description
      t.text :content
      t.string :contact_name
      t.string :contact_phone
      t.boolean :is_published, default: true
      t.text :note
      t.string :properties, array: true, default: []
      t.jsonb :features
      t.integer :impressions_count, default: 0

      t.timestamps
    end
  end
end
