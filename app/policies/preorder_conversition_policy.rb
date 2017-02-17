class PreorderConversitionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def permitted_attributes_for_create
    if user.super_admin_or_admin?
      [:site_id, :title, :content, :member_name, :member_phone, :member_address]
    else
      []
    end
  end

  def permitted_attributes_for_update
    if user.super_admin_or_admin?
      [:factory_confirm]
    elsif user.has_role?(:agent)
      [:site_confirm]
    else
      []
    end
  end
end
