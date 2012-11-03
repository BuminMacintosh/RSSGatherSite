require 'open-uri'
require 'rss'

class SiteController < ApplicationController
  def show
    @rss_contents = Array.new()

    # RSSURLマスタからRSSを取得する
    RssUrl.sortedAll.each do |rssUrl|
      rss = open(rssUrl.Site_Url) { |file| RSS::Parser.parse(file.read) }
      # (親)ヘッダ部
      parentHeader = Content.new
      parentHeader.name = rssUrl.Site_Name
      parentHeader.subContent = Array.new()
      # (子)コンテンツ部分
      rss.items.each_index do |idx|
        if idx >= rssUrl.Getting_Count
          break
        end
        childContent = Content.new
        childContent.title = rss.items[idx].title
        childContent.link = rss.items[idx].link
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
