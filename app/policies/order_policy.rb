class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    user.super_admin_or_admin? || user.permission?(:create_order)
  end

  def update?
    user.super_admin_or_admin? || user.permission?([:order_material_split, :confirm_delivery])
  end

  def permitted_attributes_for_create
    if user.super_admin_or_admin? || user.permission?(:create_order)
      [:user_id, :site_id, :code, :member_id, :preorder_conversition_id, :price, :description, :status, :internal_status, :member_name, :mobile_phone, :image_item_ids => [], :attachment_ids => []]
    else
      [:status, :internal_status]
    end
  end

  def permitted_attributes_for_update
    permitted_attributes_for_create
  end

  def create_comment?
    create?
  end
end
