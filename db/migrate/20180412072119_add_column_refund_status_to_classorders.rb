class AddColumnRefundStatusToClassorders < ActiveRecord::Migration[5.0]
  def change
    add_column :classorders, :refund_status, :integer
  end
end
