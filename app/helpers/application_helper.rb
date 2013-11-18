module ApplicationHelper

  def full_title(page_title)
    base_title = "PriceFit"
    return base_title if page_title.empty?
    return "#{base_title} | #{page_title}"
  end

  def url_with_protocol(url)
    /^http/.match(url) ? url : "http://#{url}"
  end
end
