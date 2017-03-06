class ProducePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def need_export?
    index?
  end

  def permitted_attributes_for_create
    # fail "请在#{__FILE__}中添加params的permit属性"
    if user.super_admin_or_admin?
      [:assignee_id, :status]
    else
      []
    end
  end

  def permitted_attributes_for_update
    permitted_attributes_for_create
  end
end
