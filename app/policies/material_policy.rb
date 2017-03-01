class MaterialPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def batch_create?
    create?
  end

  def audit?
    show?
  end

  def purchase?
    show?
  end

  def permitted_attributes_for_create
    if user.super_admin_or_admin?
      [:name, :name_py, :catalog_id, :min_stock, :price, :unit, :brand, :image_item_ids => [], :vendor_ids => []]
    else
      []
    end
  end

  def permitted_attributes_for_update
    permitted_attributes_for_create
  end
end
