class CreateMaterialOutputDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :material_output_details do |t|
      t.references :material_output
      t.integer :material_id
      t.integer :number
      t.jsonb :features
      t.timestamps
    end
  end
end
