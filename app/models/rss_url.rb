class RssUrl < ActiveRecord::Base
  self.primary_key = 'Rss_Url_id_seq'
  attr_accessible :Rss_Url_id_seq, :Site_Name, :Site_Url
end
