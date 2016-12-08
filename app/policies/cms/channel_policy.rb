class Cms::ChannelPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def permitted_attributes_for_create
    if user.has_role? :admin
      [:site_id, :parent_id, :title, :short_title, :properties, :tmp_index, :tmp_detail, :keywords, :description, :image_path, :content]
    else
      []
    end
  end

  def permitted_attributes_for_update
    permitted_attributes_for_create
  end
end
