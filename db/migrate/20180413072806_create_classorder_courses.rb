class CreateClassorderCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :classorder_courses do |t|
      t.belongs_to :course, index: true
      t.belongs_to :classorder, index: true
      t.integer :amount
    end
  end
end
