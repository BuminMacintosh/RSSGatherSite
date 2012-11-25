class RssUrl < ActiveRecord::Base
  attr_accessible :Rss_Url_id_seq, :Site_Name, :Site_Url, :Getting_Count
  
  validates_presence_of :Rss_Url_id_seq, :Site_Name, :Site_Url, :Getting_Count
  validates_numericality_of :Rss_Url_id_seq, :Getting_Count
  validates_length_of :Rss_Url_id_seq, :Rss_Url_id_seq, :within => 0..99
  validates_uniqueness_of :Rss_Url_id_seq, :Site_Name, :Site_Url
  
  def RssUrl.sortedAll
    RssUrl.all.sort_by { |item| item.Rss_Url_id_seq }
  end
end
