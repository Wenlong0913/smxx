class CurrentContext
  attr_reader :user, :controller_class, :action_name

  def initialize(user, controller_class, action_name)
    @user = user
    @controller_class   = controller_class
    @action_name = action_name
  end
end
