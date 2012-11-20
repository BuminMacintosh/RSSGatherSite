require 'open-uri'
require 'feed-normalizer'

class SiteController < ApplicationController
  def show
    @rss_contents = Array.new()

    # RSSURLマスタからRSSを取得する
    RssUrl.sortedAll.each do |rssUrl|
        feed = open(rssUrl.Site_Url) { |file| FeedNormalizer::FeedNormalizer.parse(file) }

        # (親)ヘッダ部
        parentHeader = Content.new
        parentHeader.name = rssUrl.Site_Name
        parentHeader.subContent = Array.new()

        # (子)コンテンツ部分
        feed.entries.each_index do |idx|
          if idx >= rssUrl.Getting_Count; break; end
          childContent = Content.new
          childContent.title = feed.entries[idx].title.force_encoding('utf-8')
          childContent.link = feed.entries[idx].url
          parentHeader.subContent.push(childContent)
        end

        @rss_contents.push(parentHeader)
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rss_contents }
    end
  end
end
