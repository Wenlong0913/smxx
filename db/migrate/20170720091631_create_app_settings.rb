class CreateAppSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :app_settings do |t|
      t.string :name
      t.string :key_word
      t.json :app_data
      t.boolean :is_used, default: false

      t.timestamps
    end
  end
end
