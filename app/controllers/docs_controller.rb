require "github/markup"
class DocsController < ApplicationController
  layout "docs"
  def index
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    page = params[:page] || 'README.md'
    file = Rails.root.join(page).to_s
    if file =~ /\.md$/ && File.dirname(file).start_with?(Rails.root.to_s) && File.exists?(file)
      render layout: true, html: GitHub::Markup.render(page, IO.read(file)).html_safe
    else
      head 404
    end
  end
end
