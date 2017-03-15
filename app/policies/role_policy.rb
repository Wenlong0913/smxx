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
    return true if user.has_role?(:super_admin) # 超级管理员能修改任何人的权限
    return false if user.has_role?(:admin, :any) && ['super_admin', 'admin'].include?(record.name) # 管理员不能修改超管和管理员角色的信息
    true
  end

  def update_permission?
    edit_permission?
  end
end
