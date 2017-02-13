class MaterialPurchasePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def permitted_attributes_for_create
    if user.has_role? :admin
      [:purchase_date, :note, :vendor_id, :status, :material_purchase_details_attributes => [:id, :material_id, :input_number, :number, :price]]
    else
      []
    end
  end

  def permitted_attributes_for_update
    permitted_attributes_for_create
  end
end
