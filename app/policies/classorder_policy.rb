class ClassorderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    user.super_admin_or_admin? || user.permission?(:create_classorder)||  user.has_role?(:agent)
  end

  def update?
    user.super_admin_or_admin? ||  user.has_role?(:agent) || user.permission?(:update_classorder)
  end
  def destroy?
    destroy? 
  end


  def permitted_attributes_for_create
    if user.super_admin_or_admin? || user.permission?(:create_order) ||  user.has_role?(:agent)
      [:image_item_ids => [], :code,:user_id,:site_id,:name,:teacher_name,:weeknu,:class_day , :class_time ,:class_place, :class_week ]

    else
      []
    end
  end

  def permitted_attributes_for_update
    permitted_attributes_for_create
  end

  def create_comment?
    create?
  end
end
