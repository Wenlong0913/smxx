class RemoveSiteForeignKeyFromCmsKeystores < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :cms_keystores, :site
    add_index :cms_keystores, :site_id
  end
end
