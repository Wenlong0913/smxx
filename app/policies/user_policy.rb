class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    return true if user.has_role? :admin
    user.has_role?(:agent) && record.site.try(:user_id) == user.id
  end

  def new?
    show?
  end

  def create?
    new?
  end

  def edit?
    return true if user.id == record.id # 自己当然能够修改自己的信息
    return false unless user.has_any_role?({name: :admin, resource: :any}, {name: :super_admin, resource: :any}) # 只有管理员和超级管理员能编辑
    return false if user.has_role?(:admin, :any) && record.has_any_role?({name: :admin, resource: :any}, {name: :super_admin, resource: :any}) # 管理员不能修改另外一个管理员的信息，当然，更不能修改超级管理员的信息
    true
  end

  def update?
    edit?
  end

  def destroy?
    return false if user.id == record.id # 自己不能删除自己的信息
    return false unless user.has_any_role?({name: :admin, resource: :any}, {name: :super_admin, resource: :any}) # 只有管理员和超级管理员能删除
    return false if user.has_role?(:admin, :any) && record.has_any_role?({name: :admin, resource: :any}, {name: :super_admin, resource: :any}) # 管理员不能删除另外一个管理员的信息，当然，更不能删除超级管理员的信息
    true
  end

  def permitted_attributes_for_create
    if user.has_role?(:admin)
      [:mobile_phone, :nickname, :role_ids => []]
    else
      [:nickname]
    end
  end

  def permitted_attributes_for_update
    if user.id == record.id
      [:mobile_phone, :nickname]
    elsif user.has_any_role?({name: :admin, resource: :any}, {name: :super_admin, resource: :any})
      [:mobile_phone, :nickname, :role_ids => []]
    else
      [:nickname]
    end
  end

end
