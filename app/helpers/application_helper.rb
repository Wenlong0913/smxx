module ApplicationHelper
  # Check current page by route paths
  # == Usage
  #  page?('admin/products') => check controller path is 'admin/products'
  #  page?('admin/products#index') => check controller path is 'admin/products' and action_name is 'index'
  #  page?('admin/products#show?id=1') => check controller_path is 'admin/products', action_name is 'show' and id is 1
  #
  # @param *paths [Array] route path
  # @return True or False
  def page?(*paths)
    !!paths.find do |path|
      others, _args = path.split('?')
      _controller, _action = others.split('#')

      flag = true
      flag = false if _args && !_args.split('&').all? { |arg| k, v = arg.split('='); params[k].to_s == v.to_s }
      flag = false if _action && action_name != _action
      flag = false if _controller != controller_path
      flag = true if path == request.fullpath
      flag
    end
  end
end
