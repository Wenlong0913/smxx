class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :coures_type
      t.text :introduction
      t.jsonb :features
      t.integer :teacher_id
      t.integer :site_id
      t.timestamps
    end
  end
end
