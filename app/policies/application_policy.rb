class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    user.has_role?(:admin)
  end

  def show?
    user.has_role?(:admin) && scope.where(:id => record.id).exists?
  end

  def create?
    user.has_role?(:admin)
  end

  def new?
    create?
  end

  def update?
    user.has_role?(:admin)
  end

  def edit?
    update?
  end

  def destroy?
    user.has_role?(:admin)
  end

  def permitted_attributes_for_create
    []
  end

  def permitted_attributes_for_update
    []
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end
    def resolve
      scope
    end
  end
end
