require 'api_subdomain'
require 'root_domain'
module CmsSubdomain
  def self.matches?(request)
    request.subdomain.present? &&
    !RootDomain.matches?(request) &&
    !DocSubdomain.matches?(request) &&
    !ApiSubdomain.matches?(request)
  end
end
