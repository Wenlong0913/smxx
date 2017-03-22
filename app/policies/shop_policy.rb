class ShopPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def permitted_attributes_for_create
    if user.super_admin_or_admin? || user.has_role?(:agent)
      [:name, :description, :content, :contact_phone, :contact_name, :note, :business_time, :is_published, :address, :impressions_count, :properties => [], :image_item_ids => []]
    else
      []
    end
  end

  def permitted_attributes_for_update
    permitted_attributes_for_create
  end
end
