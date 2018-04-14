class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :course_type
      t.text :introduction
      t.integer :site_id
      t.integer :teacher_id
      t.jsonb :features

      t.timestamps
    end
  end
end
