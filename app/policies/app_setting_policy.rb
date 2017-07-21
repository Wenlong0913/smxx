class AppSettingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    user.has_role? :super_admin
  end

  def new?
    create?
  end

  def update?
    edit?
  end

  def edit?
    user.super_admin_or_admin?
  end

  def destroy?
    create?
  end

  def used?
    edit?
  end

  def permitted_attributes_for_create
    if user.has_role? :super_admin
      [:name, :key_word, :site_share_url_pattern, :product_share_url_pattern, :system_rooms, :service_banners, :main_banners, :app_version_message]
    elsif user.has_role? :admin
      [:service_banners]
    else
      []
    end
  end

  def permitted_attributes_for_update
    permitted_attributes_for_create
  end
end
