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
    user.super_admin_or_admin? || user.has_role?(:agent)  || user.permission?(:create_course)
  end

  def edit?
    user.super_admin_or_admin? || user.has_role?(:agent) || user.permission?(:update_course) 
  end

  def update?
    edit?
  end

  def destroy?
    user.super_admin_or_admin? || user.has_role?(:agent)  || user.permission?(:destroy_course)
  end

  def course_table?
    user.super_admin_or_admin? || user.permission?(:login_admin)|| user.has_role?(:agent) 
    
  end
  def permitted_attributes_for_create
    if user.super_admin_or_admin? || user.has_role?(:agent) || user.permission?([:create_course, :update_course])
      
      [:name, :course_type, 
      :introduction,
      :age_range,  
      :sex_limit,
      :class_level, 
      :teacher_name, 
      :teacher_id, 
      :selected_number,  
      :limit_number => {}, 
      :class_week => {}, 
      :class_time => {}, 
      :class_place => {}, 
      :class_day => {}, 
      :image_item_ids => []]
    else
      []
    end
  end

  def permitted_attributes_for_update
    if user.super_admin_or_admin? || user.has_role?(:agent) || user.permission?([:course_insert, :course_update])
      [:name, :course_type, 
      :introduction,
      :age_range,  
      :sex_limit,
      :class_level, 
      :teacher_name, 
      :teacher_id, 
      :selected_number,  
      :limit_number => {}, 
      :class_week => {}, 
      :class_time => {}, 
      :class_place => {}, 
      :class_day => {}, 
      :image_item_ids => []]
    else
      []
    end
  end
end
