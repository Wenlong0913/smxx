class AddColumnFeaturesToClassorders < ActiveRecord::Migration[5.0]
  def change
    add_column :classorders, :features, :jsonb
  end
end
