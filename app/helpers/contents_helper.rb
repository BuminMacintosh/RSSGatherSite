module ContentsHelper
  def simple_time(time)
    if time == nil
      "-"
    else
      time.strftime("%m/%d %H:%M")
    end
  end
end
