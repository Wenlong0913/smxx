class Page
  Destroy =
    lambda do |page_or_id, user: nil|
      page = page_or_id.is_a?(Page) ? page_or_id : Page.find(page_or_id)
      [page.destroy, page]
    end
end