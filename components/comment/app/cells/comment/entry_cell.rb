class Comment::EntryCell < Comment::BaseCell
  def show
    render + render(view: :new, locals: { path: options[:path]})
  end
end
