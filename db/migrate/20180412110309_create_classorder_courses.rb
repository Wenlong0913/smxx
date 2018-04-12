class CreateClassorderCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :classorder_courses do |t|
      t.integer :course_id
      t.integer :classorder_id
      t.integer :amount
      t.integer :limit_number
      t.timestamps
    end
  end
end
