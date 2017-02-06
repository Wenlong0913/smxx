class CreateMaterialPurchaseDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :material_purchase_details do |t|
      t.integer :material_id
      t.references :material_purchase, foreign_key: true
      t.integer :number
      t.decimal :price, precision: 8, scale: 2
      t.timestamps
    end
  end
end
