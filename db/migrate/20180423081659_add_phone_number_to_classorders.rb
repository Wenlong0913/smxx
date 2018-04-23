class AddPhoneNumberToClassorders < ActiveRecord::Migration[5.0]
  def change
    add_column :classorders, :phone_number ,:string
  end
end
