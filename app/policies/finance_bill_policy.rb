class FinanceBillPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def permitted_attributes_for_create
    if user.has_role? :agent
      []
    else
      []
    end
  end

  def permitted_attributes_for_update
    permitted_attributes_for_create
  end
end
