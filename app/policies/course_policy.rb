class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
def course_table?
  user.super_admin_or_admin? || user.permission?(:login_admin)
  
end
  def permitted_attributes_for_create
    if user.has_role? :admin
      [:name, :course_type, :introduction,:limit_number ,:age_range,:sex_limit, :class_week,:class_time,
      :selected_number,:class_place,:class_level,:teacher_name,:teacher_id,:class_day]
    else
      []
    end
  end

  def permitted_attributes_for_update
    permitted_attributes_for_create
  end
end
