class AddDetailsToClassorders < ActiveRecord::Migration[5.0]
  def change
    add_column :classorders, :relname, :string
    add_column :classorders, :cardnu, :string
  end
end
