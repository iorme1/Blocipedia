require 'redcarpet'

module ApplicationHelper

  def markdown(text)
    options = {
      hard_wrap: true,
      filter_html: true,
      autolink: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer)

    markdown.render(text).html_safe
  end

end
