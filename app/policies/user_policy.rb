class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    return true if user.has_role? :admin
    user.has_role?(:agent) && record.site.try(:user_id) == user.id
  end

  def new?
    show?
  end

  def create?
    new?
  end

  def edit?
    show?
  end

  def update?
    edit?
  end

  def destroy?
    show?
  end

  def permitted_attributes_for_create
    if user.has_role? :admin
      [:mobile_phone, :nickname]
    else
      [:nickname]
    end
  end

  def permitted_attributes_for_update
    permitted_attributes_for_create
  end

end
