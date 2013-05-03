module TimeEntriesHelper
  def formatted_date date

    if date.year == Time.now.year
      "#{date.strftime('%A')}, #{date.day.ordinalize} #{date.strftime('%B')}"
    else
      "#{date.strftime('%a')}, #{date.day.ordinalize} #{date.strftime('%B %Y')}"
    end
  end

  def formatted_time date
    date.strftime("%H:%M")
  end

  def hour_text hour
    formatted_time(NSDate.new.start_of_day + hour.hours)
  end

end
