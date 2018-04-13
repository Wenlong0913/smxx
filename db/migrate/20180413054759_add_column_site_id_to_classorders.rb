class AddColumnSiteIdToClassorders < ActiveRecord::Migration[5.0]
  def change
    add_column :classorders, :site_id, :integer
  end
end
