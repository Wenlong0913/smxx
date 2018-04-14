class TeacherPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def dashboard?
    user.super_admin_or_admin? || user.permission?(:login_admin)
  end

  def index?
    user.super_admin_or_admin? || user.has_role?(:agent) || user.has_role?(:worker)
  end

  def show?
    return true if user.super_admin_or_admin? || user.has_role?(:worker)
    user.has_role?(:agent) && record.site.try(:user_id) == user.id
  end

  def new?
    user.super_admin_or_admin? || user.has_role?(:agent) 
  end

  def create?
    user.super_admin_or_admin? || user.has_role?(:agent)  
  end

  def edit?
    user.super_admin_or_admin? || user.has_role?(:agent) 
  end

  def update?
    edit?
  end

  def destroy?
    user.super_admin_or_admin? || user.has_role?(:agent) 
  end

  def permitted_attributes_for_create
    if user.super_admin_or_admin? || user.has_role?(:agent) 
      
      [:name, :phone,:IDcard, :email, :address, :site_id, :image_item_ids => []]
    else
      []
    end
  end

  def permitted_attributes_for_update
    permitted_attributes_for_create
  end
end
