module TimeEntryHelper

  def y_to_time(y)
    y = y.round - 10
    hours = y / hour_height
    hours_to_time(hours)
  end

  def time_to_y(time)
    entry_hour = time_to_hours(time)
    10 + (entry_hour * hour_height)
  end

  def time_to_hours(time)
    time.hour + (time.min / 60.0)
  end

  def hours_to_time(hours)
    minutes = hours * 60
    Time.now.beginning_of_day + minutes.minutes
  end

  def range_from_entry(entry)
    start = time_to_15_int(entry.time)
    finish = (entry.minutes / 15) + start - 1
    start..finish
  end

  def time_to_15_int(time)
    ((time.hour * 60) + time.min) / 15
  end

  def index_to_time(index)
    minutes = index * 15
    hours_to_time(minutes / 60.0)
  end

  def range_from_entries(entries)
    entries.map {|e| range_from_entry(e).to_a }.flatten
  end

end
