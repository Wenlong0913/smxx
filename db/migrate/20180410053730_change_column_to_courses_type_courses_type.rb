class ChangeColumnToCoursesTypeCoursesType < ActiveRecord::Migration[5.0]
  def change
    rename_column :courses, :type, :course_type
  end
end
