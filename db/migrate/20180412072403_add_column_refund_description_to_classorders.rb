class AddColumnRefundDescriptionToClassorders < ActiveRecord::Migration[5.0]
  def change
    add_column :classorders, :refund_description, :text
  end
end
