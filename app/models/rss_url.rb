require 'open-uri'
require 'feed-normalizer'

class RssUrl < ActiveRecord::Base
  attr_accessible :sort_number, :name, :url, :limit_count

  # content of feed (not saved to database, this is refer only)
  attr_accessor :feed

  validates_presence_of :sort_number, :name, :url, :limit_count
  validates_numericality_of :sort_number, :limit_count
  validates_length_of :sort_number, :limit_count, :within => 0..99
  validates_uniqueness_of :sort_number, :name, :url
  validate :cannot_specified_invalid_url

  # feed data is dynamic creation, bcz not save to database.
  def init_feed
    return nil if self.url.blank?
    @feed = FeedNormalizer::FeedNormalizer.parse(open(self.url))
  end

  # if saved invalid rss uri, occurs exception by contoller
  def cannot_specified_invalid_url
    errors.add(:url, :invalid) if init_feed.blank?
  end
  private :cannot_specified_invalid_url
end
