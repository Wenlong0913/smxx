class CreatePermissions < ActiveRecord::Migration[5.0]
  def change
    create_table :permissions do |t|
      t.string :name
      t.string :controller_class
      t.string :action_name

      t.timestamps
    end
  end
end
