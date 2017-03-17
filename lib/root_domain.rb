module RootDomain
  def self.matches?(request)
    request.subdomain.blank?
  end
end
