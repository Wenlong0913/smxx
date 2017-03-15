class OrderMaterialPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def need_purchase?
    index?
  end

  def update?
    user.super_admin_or_admin? || user.permission?('order_material_split') || user.permission?('storage')
  end

  def permitted_attributes_for_create
    if user.super_admin_or_admin? || user.permission?('order_material_split')
      [:material_id, :amount, :factory_expected_number]
    else
      []
    end
  end

  def permitted_attributes_for_update
    if user.super_admin_or_admin?
       [:factory_expected_number, :practical_number, :purchase_status]
    elsif user.permission?('storage')
      [:purchase_status]
    else
      []
    end
  end
end
