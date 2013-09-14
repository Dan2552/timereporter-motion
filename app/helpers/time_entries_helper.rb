module TimeEntriesHelper
  def formatted_date date

    if date.year == Time.now.year
      "#{date.strftime('%a')}, #{date.day.ordinalize} #{date.strftime('%b')}"
    else
      "#{date.strftime('%a')}, #{date.day.ordinalize} #{date.strftime('%b %Y')}"
    end
  end

  def formatted_time date
    date.strftime("%H:%M")
  end

  def hour_text hour
    formatted_time(NSDate.new.beginning_of_day + hour.hours)
  end

end
