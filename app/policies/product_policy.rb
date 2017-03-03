class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    user.super_admin_or_admin? || user.has_role?(:agent)
  end

  def show?
    return true if user.super_admin_or_admin?
    user.has_role?(:agent) && record.site.try(:user_id) == user.id
  end

  def new?
    user.super_admin_or_admin? || user.has_role?(:agent)
  end

  def create?
    user.super_admin_or_admin? || (user.has_role?(:agent) && record.site.try(:user_id) == user.id)
  end

  def edit?
    create?
  end

  def update?
    edit?
  end

  def destroy?
    create?
  end

  def permitted_attributes_for_create
    if user.super_admin_or_admin? || user.has_role?(:agent)
      [:site_id, :name, :price, :stock, :unit, :discount, :description, :weight, :weight_unit, :additional_attribute_keys, :additional_attribute_values, :is_shelves, :is_fee, :shopping_fee, :catalog_id, :image_item_ids => []]
    else
      [:name, :price, :stock, :unit, :discount, :description, :weight, :weight_unit, :additional_attribute_keys, :additional_attribute_values, :is_shelves, :is_fee, :shopping_fee, :catalog_id,  :image_item_ids => []]
    end
  end

  def permitted_attributes_for_update
    permitted_attributes_for_create
  end
end
