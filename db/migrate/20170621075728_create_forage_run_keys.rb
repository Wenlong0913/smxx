class CreateForageRunKeys < ActiveRecord::Migration[5.0]
  def change
    create_table :forage_run_keys do |t|
      t.references :forage_source, foreign_key: true
      t.datetime :date
      t.boolean :is_processed, default: false
      t.datetime :processed_at
      t.integer :total_count, default: 0

      t.timestamps
    end
  end
end
