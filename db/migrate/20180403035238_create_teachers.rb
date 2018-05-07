class CreateTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :teachers do |t|
      t.integer :site_id
      t.string :name
      t.string :phone
      t.string :IDcard
      t.string :email
      t.string :address

      t.timestamps
    end
  end
end
