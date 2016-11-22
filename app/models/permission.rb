class Permission < ApplicationRecord
  has_and_belongs_to_many :roles

  def permission?(klass, action)
    controller_class == klass.to_s && action_name.to_s.split(',').include?(action.to_s)
  end
end
