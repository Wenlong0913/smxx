class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def dashboard?
    user.super_admin_or_admin? || user.permission?(:login_admin)
  end

  def index?
    user.super_admin_or_admin? || user.has_role?(:agent) || user.has_role?(:worker)
  end

  def show?
    return true if user.super_admin_or_admin? || user.has_role?(:worker)
    user.has_role?(:agent) && record.site.try(:user_id) == user.id
  end

  def new?
    user.super_admin_or_admin? || user.has_role?(:agent) || user.permission?(:product_insert)
  end

  def create?
    user.super_admin_or_admin? || (user.has_role?(:agent) && record.site.try(:user_id) == user.id) || user.permission?(:product_insert)
  end

  def edit?
    user.super_admin_or_admin? || (user.has_role?(:agent) && record.site.try(:user_id) == user.id) || user.permission?(:product_update)
  end

  def update?
    edit?
  end

  def destroy?
    user.super_admin_or_admin? || (user.has_role?(:agent) && record.site.try(:user_id) == user.id) || user.permission?(:product_delete)
  end

  def permitted_attributes_for_create
    if user.super_admin_or_admin? || user.has_role?(:agent)

      [:site_id, :name, :price, :old_price, :responsive_person, :warning_message,
        :service_time, :month_number, :image, :stock, :unit, :discount, :description,
        :content, :weight, :weight_unit, :additional_attribute_keys, :additional_attribute_values,
        :is_shelves, :is_fee, :shopping_fee, :catalog_id, :hot, :recommend, :event, :promotion, :discount,
        :properties => [], :image_item_ids => [], :tag_list => []]
      #=======
      #[:site_id, :name, :price, :stock, :unit, :discount, :description, :content, :weight, :weight_unit, :additional_attribute_keys, :additional_attribute_values, :is_shelves, :is_fee, :shopping_fee, :catalog_id, :hot, :recommend, :event, :promotion, :discount, :image_item_ids => [], :tag_list => []]
      #>>>>>>> dagle-master
    else
      []
    end
  end

  def permitted_attributes_for_update
    permitted_attributes_for_create
  end
end
