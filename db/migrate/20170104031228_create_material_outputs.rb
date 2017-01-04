class CreateMaterialOutputs < ActiveRecord::Migration[5.0]
  def change
    create_table :material_outputs do |t|
      t.date :output_date
      t.string :note
      t.timestamps
    end
  end
end
