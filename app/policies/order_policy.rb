class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def permitted_attributes_for_create
    if user.super_admin_or_admin?
      [:user_id, :site_id, :member_id, :preorder_conversition_id, :price, :description, :status, :internal_status, :member_name, :mobile_phone, :image_item_ids => [], :attachment_ids => []]
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
