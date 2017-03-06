class ProducePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
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
    if user.super_admin_or_admin?
      [:status]
    else
      []
    end
  end
end
