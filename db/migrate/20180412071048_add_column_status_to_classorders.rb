class AddColumnStatusToClassorders < ActiveRecord::Migration[5.0]
  def change
    add_column :classorders, :status, :integer
  end
end
