class Favorite::EntryCell < Favorite::BaseCell
  property :favorites
  def show
    render
  end
end
