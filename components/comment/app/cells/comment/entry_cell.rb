class Comment::EntryCell < Comment::BaseCell
  def show
    "<div rel='comment-block' data-uuid=" + SecureRandom.uuid + ">" + render + render(view: :new, locals: { path: options[:path]}) + "</div>"
  end
end
