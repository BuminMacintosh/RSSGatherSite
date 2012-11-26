module ContentsHelper
  def simple_time(time)
    if time == nil
      "-"
    else
      time.strftime("%m/%d %H:%M")
    end
  end

  def simple_Header(feed, rssUrl)
    header = Content.new
    header.title = (feed.title || rssUrl.Site_Name).force_encoding('utf-8')
    header.link = feed.url || rssUrl.Site_Url
    header.subContents = Array.new()

    return header
  end

  def simple_Entry(feedEntry)
    entry = Content.new
    entry.title = (feedEntry.title || "-").force_encoding('utf-8')
    entry.link = feedEntry.url || "about:blank"
    entry.date = feedEntry.last_updated || feedEntry.date_published

    return entry
  end

end
