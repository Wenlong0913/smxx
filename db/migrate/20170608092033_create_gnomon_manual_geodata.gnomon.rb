# This migration comes from gnomon (originally 20170608090843)
class CreateGnomonManualGeodata < ActiveRecord::Migration[5.0]
  def change
    create_table :gnomon_manual_geodata do |t|
      t.decimal :lng, precision: 20, scale: 14
      t.decimal :lat, precision: 20, scale: 14
      t.references :resource, polymorphic: true
      t.timestamps
    end
  end
end
