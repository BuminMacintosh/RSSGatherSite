require 'open-uri'
require 'feed-normalizer'

module ApplicationHelper
  def simple_Rssfeed(url)
    FeedNormalizer::FeedNormalizer.parse(open(url), :force_parser => FeedNormalizer::SimpleRssParser, :try_others => true)
  end
end
