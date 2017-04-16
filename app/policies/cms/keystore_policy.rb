class Cms::KeystorePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def permitted_attributes_for_create
    if user.super_admin_or_admin?  || user.has_role?(:agent)
      [:site_id, :key, :value, :description]
    else
      []
    end
  end

  def permitted_attributes_for_update
    permitted_attributes_for_create
  end
end
