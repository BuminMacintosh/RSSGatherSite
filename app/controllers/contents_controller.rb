require 'open-uri'
require 'feed-normalizer'

class ContentsController < ApplicationController
  def show
    @contents = Array.new()

    # RSSURLマスタからRSSを取得する
    RssUrl.sortedAll.each do |rssUrl|
        feed = open(rssUrl.Site_Url) do |xml|
          FeedNormalizer::FeedNormalizer.parse(
            xml,
            :force_parser => FeedNormalizer::SimpleRssParser,
            :try_others => true
          )
        end

        # (親)ヘッダ部
        parentHeader = Content.new
        parentHeader.title = feed.title
        parentHeader.link = feed.url
        parentHeader.subContent = Array.new()

        # (子)コンテンツ部分
        feed.entries.each_index do |idx|
          if idx >= rssUrl.Getting_Count; break; end
          childContent = Content.new
          childContent.title = feed.entries[idx].title.force_encoding('utf-8')
          childContent.link = feed.entries[idx].url
          childContent.date = feed.entries[idx].last_updated
          parentHeader.subContent.push(childContent)
        end

        @contents.push(parentHeader)
    end
  end
end
