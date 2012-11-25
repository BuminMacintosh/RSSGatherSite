require 'open-uri'
require 'feed-normalizer'

class ContentsController < ApplicationController
  def show
    @contents = Array.new()

    # RSSURLマスタからRSSを取得する
    RssUrl.sortedAll.each do |rssUrl|
        feed = open(rssUrl.Site_Url) { |xml| FeedNormalizer::FeedNormalizer.parse(xml) }

        # (親)ヘッダ部
        parentHeader = Content.new
        parentHeader.title = feed.title.force_encoding('utf-8')
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
