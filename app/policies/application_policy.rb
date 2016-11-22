class ApplicationPolicy
  attr_reader :user, :record

  def initialize(context, record)
    @user = context.user
    @controller_class = context.controller_class
    @action_name = context.action_name
    @record = record
  end

  def has_permission?
    @user ? @user.permission?(@controller_class, @action_name) : true
  end

  def index?
    has_permission?
  end

  def show?
    has_permission? && scope.where(:id => record.id).exists?
  end

  def create?
    has_permission?
  end

  def new?
    create?
  end

  def update?
    has_permission?
  end

  def edit?
    update?
  end

  def destroy?
    has_permission?
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
