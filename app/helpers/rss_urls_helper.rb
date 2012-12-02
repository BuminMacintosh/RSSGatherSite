module RssUrlsHelper
  def simple_time(time)
    return "-" if time == nil
    return time.strftime("%m/%d %H:%M")
  end

  def encoding_utf8(string)
    return string.force_encoding("utf-8")
  end
end
