class Site
  Update =
    lambda do |site_or_id, attributes, user: nil|
      site = site_or_id.is_a?(Site) ? site_or_id : Site.find(site_or_id)
      site.assign_attributes attributes
      [site.save, site]
    end
end