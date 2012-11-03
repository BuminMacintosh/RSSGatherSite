class RssUrl < ActiveRecord::Base
  attr_accessible :Rss_Url_id_seq, :Site_Name, :Site_Url, :Getting_Count

  def RssUrl.sortedAll
    RssUrl.all.sort_by {|item| item.Rss_Url_id_seq}
  end
end
