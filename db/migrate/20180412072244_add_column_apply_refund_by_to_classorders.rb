class AddColumnApplyRefundByToClassorders < ActiveRecord::Migration[5.0]
  def change
    add_column :classorders, :apply_refund_by, :integer
  end
end
