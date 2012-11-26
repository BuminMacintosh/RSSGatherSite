class ContentsController < ApplicationController
  include ApplicationHelper
  include ContentsHelper

  def show
    @contents = Array.new();

    RssUrl.sortedAll.each do |rssUrl|
      begin
        feed = simple_Rssfeed(rssUrl.Site_Url)
        next if feed.blank?

        header = simple_Header(feed)
        entries = feed.entries.slice(0..(rssUrl.Getting_Count - 1))
        entries.each { |entry| header.subContents.push(simple_Entry(entry)) }

        @contents.push(header)
      rescue => exception
        p exception
      end
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contents }
    end
  end
end
