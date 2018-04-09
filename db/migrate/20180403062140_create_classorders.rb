class CreateClassorders < ActiveRecord::Migration[5.0]
  def change
    create_table :classorders do |t|
      t.string :user_id
      t.integer :course_id
      t.string :name
      t.string :teacher_name
      t.string :weeknu
      t.string :class_day
      t.string :class_week
      t.string :class_time
      t.jsonb :class_place

      t.timestamps
    end
  end
end
