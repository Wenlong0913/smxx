class CreateForageCatalogRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :forage_catalog_relations do |t|
      t.string :name
      t.references :catalog
      t.json :features

      t.timestamps
    end
  end
end
