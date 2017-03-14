class RolePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    user.super_admin_or_admin?
  end

  def edit_permission?
    index?
  end

  def update_permission?
    edit_permission?
  end

  def permitted_attributes_for_create
    if user.super_admin_or_admin?
      [:name, :permission_ids => []]
    else
      []
    end
  end

  def permitted_attributes_for_update
    permitted_attributes_for_create
  end
end
