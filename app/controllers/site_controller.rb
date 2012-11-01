require 'open-uri'
require 'rss'

class SiteController < ApplicationController
  def show
    @rss_contents = Array.new()

    @rss_Urls = RssUrl.all

    # RSSURLƒ}ƒXƒ^‚©‚çRSS‚ðŽæ“¾‚·‚é
    @rss_Urls.each do |rssUrl|
      rss = open(rssUrl.Site_Url) { |file| RSS::Parser.parse(file.read) }
      rss.items.each do |item|
        content = Content.new
        content.init(rssUrl.Site_Name, item.title, item.link)
        @rss_contents.push(content)
      end
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rss_contents }
    end
  end
end
