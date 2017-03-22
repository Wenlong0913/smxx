class CreateShopSites < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_sites do |t|
      t.references :shop, foreign_key: true
      t.references :site, foreign_key: true

      t.timestamps
    end
  end
end
