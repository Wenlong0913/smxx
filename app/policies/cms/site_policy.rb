class Cms::SitePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def permitted_attributes_for_create
    if user.has_role? :admin
      [:name, :template, :domain, :description, :is_published]
    else
      []
    end
  end

  def permitted_attributes_for_update
    permitted_attributes_for_create
  end
end
