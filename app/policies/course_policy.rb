class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def dashboard?
    user.super_admin_or_admin? || user.permission?(:login_admin)
  end

  def index?
    user.super_admin_or_admin? || user.has_role?(:agent) 
  end

  def show?
    return true if user.super_admin_or_admin? || user.has_role?(:worker)
    user.has_role?(:agent) && record.site.try(:user_id) == user.id
  end

  def new?
    user.super_admin_or_admin? || user.has_role?(:agent) 
  end

  def create?
    user.super_admin_or_admin? || user.has_role?(:agent)  || user.permission?(:course_insert)
  end

  def edit?
    user.super_admin_or_admin? || user.has_role?(:agent) || user.permission?(:course_update) 
  end

  def update?
    edit?
  end

  def destroy?
    user.super_admin_or_admin? || user.has_role?(:agent)  || user.permission?(:course_delete)
  end

  def course_table?
    user.super_admin_or_admin? || user.permission?(:login_admin)|| user.has_role?(:agent) 
    
  end
  def permitted_attributes_for_create
    if user.super_admin_or_admin? || user.has_role?(:agent) || user.permission?([:course_insert, :update_course])
      
      [:name, :course_type, 
      :introduction,
      :age_range,  
      :sex_limit,
      :class_level, 
      :teacher_name, 
      :teacher_id, 
      :selected_number,  
      :image_item_ids => []]
    else
      []
    end
  end

  def permitted_attributes_for_update
    permitted_attributes_for_create
  end
end
