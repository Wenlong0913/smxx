class ClassorderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def create?
    user.super_admin_or_admin? || user.permission?(:create_order)
  end

  def update?
    user.super_admin_or_admin? || user.permission?([:order_material_split, :confirm_delivery]) || user.has_role?(:agent)
  end
  def refund?
    user.super_admin_or_admin? || user.permission?(:refund_order)
  end

  def apply_refund?
    user.super_admin_or_admin? || user.permission?(:refund_order)
  end

  def refund_success?
    user.super_admin_or_admin? || user.permission?(:refund_success)
  end

  def refunds?
    user.super_admin_or_admin? || user.permission?(:refund_order)
  end

  def permitted_attributes_for_create
    fail "请在#{__FILE__}中添加params的permit属性"
    if user.has_role? :admin
      []
    else
      []
    end
  end

  def permitted_attributes_for_update
    permitted_attributes_for_create
  end

end
