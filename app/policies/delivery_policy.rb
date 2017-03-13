class DeliveryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def permitted_attributes_for_create
    # fail "请在#{__FILE__}中添加params的permit属性"
    if user.has_role? :admin
      [:name, :features, :address, :phone_number]
    else
      []
    end
  end

  def permitted_attributes_for_update
    permitted_attributes_for_create
  end
end
