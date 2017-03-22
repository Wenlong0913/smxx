class SitePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    user.super_admin_or_admin?
  end

  def show?
    user.super_admin_or_admin? || user.id == record.user_id
  end

  def new?
    user.super_admin_or_admin? || user.has_role?(:agent)
  end

  def create?
    user.super_admin_or_admin? || user.has_role?(:agent)
  end

  def edit?
    user.super_admin_or_admin? || user.id == record.user_id
  end

  def update?
    user.super_admin_or_admin? || user.id == record.user_id
  end

  def destroy?
    record.id != Site::MAIN_ID && user.super_admin_or_admin?
  end

  def permitted_attributes_for_create
    if user.super_admin_or_admin?
      [:user_id, :title, :description ]
    else
      [:title, :description]
    end
  end

  def permitted_attributes_for_update
    permitted_attributes_for_create
  end
end
