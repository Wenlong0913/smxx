class SitePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    user.super_admin_or_admin? || user.has_role?(:worker)
  end

  def show?
    user.super_admin_or_admin? || user.id == record.user_id || user.has_role?(:worker)
  end

  def new?
    user.super_admin_or_admin? || user.has_role?(:agent) || user.permission?(:communities_insert)
  end

  def create?
    new?
  end

  def edit?
    user.super_admin_or_admin? || user.id == record.user_id  || user.permission?(:communities_update)
  end

  def update?
    edit?
  end

  def destroy?
    record.id != Site::MAIN_ID && user.super_admin_or_admin?
  end

  def permitted_attributes_for_create
    if user.super_admin_or_admin?
      [:user_id, :title, :description, :properties, :business_hours,
        :recommendation, :good_summary, :bad_summary, :parking,
        :wifi, :contact_name, :contact_phone, :has_contract, :contract_note,
        :avg_price, :is_published, :phone, :photos, :province, :city, :area, :business_area,
        :lat, :lng, :catalog_id, :address_line, :content, :is_sign, :sign_note, :score, :comment,
        :image_item_ids => []]
    else

    end
  end

  def permitted_attributes_for_update
    permitted_attributes_for_create
  end
end
