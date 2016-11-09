class Page
  Create =
    lambda do |attributes, user: nil|
      page = Page.new(attributes)
      [page.save, page]
    end
end