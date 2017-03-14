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
end
