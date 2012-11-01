class Content
  def init(site_name, title, link)
    @site_name = site_name
    @title = title
    @link = link
  end
  
  attr_accessor :site_name, :title, :link
end
