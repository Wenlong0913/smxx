class FixForageRunkeySimpleDetail < ActiveRecord::Migration[5.0]
  def change
    remove_column :forage_run_keys, :forage_source_id
    remove_column :forage_simples, :forage_run_key_id
    remove_column :forage_details, :forage_simple_id

    add_column :forage_run_keys, :source_id, :integer, null: false, index: true

    add_column :forage_simples, :run_key_id, :integer, null: false, index: true

    add_column :forage_details, :simple_id, :integer, null: false, index: true
  end
end
