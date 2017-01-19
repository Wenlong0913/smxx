class MaterialManagementPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def permitted_attributes_for_create
    # fail "请在#{__FILE__}中添加params的permit属性"
    if user.super_admin_or_admin?
      [:operate_date, :operate_type, :note, :material_warehouse_id, :material_management_details_attributes => [:id, :material_id, :number]]
    else
      []
    end
  end

  def permitted_attributes_for_update
    if user.super_admin_or_admin?
      [:operate_date, :note]
    else
      []
    end
  end

end
