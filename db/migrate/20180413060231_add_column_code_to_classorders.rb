class AddColumnCodeToClassorders < ActiveRecord::Migration[5.0]
  def change
    add_column :classorders, :code, :string
  end
end
