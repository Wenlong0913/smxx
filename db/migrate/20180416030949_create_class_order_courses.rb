class CreateClassOrderCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :classorder_courses do |t|
      t.references :classorder, foreign_key: true
      t.references :course, foreign_key: true
    end
  end
end
