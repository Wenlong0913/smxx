class Site
  Create =
    lambda do |attributes, user: nil|
      site = Site.new(attributes)
      [site.save, site]
    end
end