class Role < ApplicationRecord
  has_and_belongs_to_many :users, :join_table => :users_roles
  has_and_belongs_to_many :permissions

  belongs_to :resource,
             :polymorphic => true,
             :optional => true

  validates :resource_type,
            :inclusion => { :in => Rolify.resource_types },
            :allow_nil => true

  scopify

  def permission?(klass, action)
    permissions.detect { |p| p.permission?(klass, action) }
  end

end
