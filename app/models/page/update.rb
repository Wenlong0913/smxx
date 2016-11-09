class Page
  Update =
    lambda do |page_or_id, attributes, user: nil|
      page = page_or_id.is_a?(Page) ? page_or_id : Page.find(page_or_id)
      page.assign_attributes attributes
      [page.save, page]
    end
end