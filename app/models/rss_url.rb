class RssUrl < ActiveRecord::Base
  include ApplicationHelper
  attr_accessible :Rss_Url_id_seq, :Site_Name, :Site_Url, :Getting_Count

  validates_presence_of :Rss_Url_id_seq, :Site_Name, :Site_Url, :Getting_Count
  validates_numericality_of :Rss_Url_id_seq, :Getting_Count
  validates_length_of :Rss_Url_id_seq, :Rss_Url_id_seq, :within => 0..99
  validates_uniqueness_of :Rss_Url_id_seq, :Site_Name, :Site_Url
  validate :cannot_specified_invalid_url

  def cannot_specified_invalid_url
    errors.add(:Site_Url, :invalid) if simple_Rssfeed(self.Site_Url).blank?
  end

  def RssUrl.sortedAll
    RssUrl.all.sort_by { |item| item.Rss_Url_id_seq }
  end
end
