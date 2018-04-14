class AddColumnToTeachers < ActiveRecord::Migration[5.0]
  def change
    add_column :teachers, :description, :text
  end
end
