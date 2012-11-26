require 'open-uri'
require 'feed-normalizer'

module ApplicationHelper
  def simple_Rssfeed(url)
    return FeedNormalizer::FeedNormalizer.parse(open(url))
  end
end
