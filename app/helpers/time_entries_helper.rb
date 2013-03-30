module TimeEntriesHelper
  def formatted_date date
    date.date_array.join("-")
  end

  def formatted_time date
    date.strftime("%H:%M")
  end

  def hour_text hour
    formatted_time(NSDate.new.start_of_day + hour.hours)
  end
end
