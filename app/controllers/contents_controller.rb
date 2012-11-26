class ContentsController < ApplicationController
  include ApplicationHelper
  include ContentsHelper

  def add_Content(content)
    if nil == @contents; @contents = Array.new(); end
    @contents.push(content)
  end

  def show
    RssUrl.sortedAll.each do |rssUrl|
        feed = simple_Rssfeed(rssUrl.Site_Url)
        next if feed.blank?

        header = simple_Header(feed)
        entries = feed.entries.slice(0..rssUrl.Getting_Count)
        entries.each { |entry| header.subContents.push(simple_Entry(entry)) }

        add_Content(header)
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contents }
    end
  end
end
