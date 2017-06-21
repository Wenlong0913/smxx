class FinanceBill < ActiveRecord::Migration[5.0]
  def change
    create_table :finance_bills do |t|
      t.decimal :amount, precision: 8, scale: 2
      t.integer :status

      t.timestamps
    end
  end
end
