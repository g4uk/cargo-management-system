# frozen_string_literal: true

module Breadcrumbs
  def breadcrumbs(&block)
    content_tag :ol, class: 'breadcrumb' do
      yield if block_given?
    end
  end

  def breadcrumb(name = nil, url = nil, html_options = {})
    if name
      html_options[:class] = "breadcrumb-item #{html_options[:class]}"
      html_options[:class] = "#{html_options[:class]} active".lstrip if url.blank?
      content_tag :li, html_options do
        url ? link_to(name, url) : name
      end
    end
  end
end
