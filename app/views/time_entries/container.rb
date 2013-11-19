class TimeViewContainer < UIScrollView
  include TimeEntryHelper
  attr_accessor :data_source, :reusable_hour_view, :reusable_time_entry_view, :data

  def hour_height
    self.reusable_hour_view.try(:height) || 0
  end

  def setupFrame
    height = hour_height * 24
    self.contentSize = [self.width, height]
  end

  def refresh
    self.setNeedsDisplay
  end

  def data_source= new_source
    refresh
    super
  end

  def drawRect(rect)
    return unless reusable_hour_view && reusable_time_entry_view
    setupFrame
    self.subviews.each { |v| v.removeFromSuperview }
    24.times do |n|
      new_hour(
        y: n * hour_height,
        hour: n
      )
    end

    load_data if data_source
  end

  def data
    @data ||= []
  end

  def load_data
    self.data = data_source.entry_view_data

    data.each do |entry|

      duration_in_hours = entry.minutes / 60.0
      new_entry(
        y: time_to_y(entry.time),
        height: duration_in_hours * hour_height,
        time_entry: entry,
        text: "Apples - #{duration_in_hours}",
        wobble: true
      )
    end
  end

  def new_entry(options)
    view = self.reusable_time_entry_view.reuse(options)
    view.hidden = false
    view.clipsToBounds = true
    view.container = self
    self.addSubview(view)
  end

  def new_hour(options)
    view = self.reusable_hour_view.reuse(options)
    view.hidden = false
    view.clipsToBounds = true
    self.addSubview(view)
  end

  def reusable_hour_view= view
    view.removeFromSuperview
    super
  end

  def reusable_time_entry_view= view
    view.removeFromSuperview
    super
  end




  def taken_slots_excluding_entry(time_entry)
    entries = data.clone
    entries.delete time_entry
    range_from_entries(entries)
  end

  def snap_to_15(entry_view)
    height_of_min = (hour_height / 60.0)
    fifteen_min = 15 * height_of_min
    top_offset = 10

    y = entry_view.y - top_offset

    closeness = y % fifteen_min
    diff = fifteen_min - closeness
    y = y + diff

    entry_view.y = y + top_offset
  end

  def move_to_nearest_valid(entry_view)
    debug entry_view
    snap_to_15(entry_view)
    entry = entry_view.time_entry
    entry.time = y_to_time(entry_view.y)
    puts "time: #{entry.time}"
    destination = range_from_entry(entry)
    taken_slots = taken_slots_excluding_entry(entry)
    destination.to_a.each do |dest|
      if taken_slots.include? dest
        puts "overlap!"
        return find_next_best(entry_view, destination, taken_slots)
      end

    end
  end

  def find_next_best(entry_view, destination, taken_slots)
    entry = entry_view.time_entry
    size = destination.to_a.size
    puts "target #{index_to_time destination.first}"
    up = search_up(taken_slots, size, destination.first)
    down = search_down(taken_slots, size, destination.first)

    diff_up = destination.first - up rescue 999
    diff_down = destination.last - down - destination.to_a.size rescue 999

    puts "up: #{diff_up.abs}, down: #{diff_down.abs}"
    if diff_up.abs <= diff_down.abs
      puts "move up"
      UIView.animate do
        entry_view.y = time_to_y(index_to_time(up))
        entry.time = index_to_time(up)
      end
    else
      puts "move down"
      UIView.animate do
        entry_view.y = time_to_y(index_to_time(down))
        entry.time = index_to_time(down)
      end
    end
  end

  def search_up(taken_slots, size, last_attempt)
    attempt = last_attempt - 1
    return false if attempt < 0
    #puts "attempting #{index_to_time attempt}"
    if !taken_slots.include?(attempt)
      if size.times.map { |s| taken_slots.include? attempt + s }.include? true
        #puts "doesn't fit"
      else
        puts "found a fit up! #{index_to_time attempt}"
        return attempt
      end
    end
    search_up(taken_slots, size, attempt)
  end

  def search_down(taken_slots, size, last_attempt)
    attempt = last_attempt + 1
    #todo return if attempt > whatever the highest possible should be
    #puts "attempting #{index_to_time attempt}"
    if !taken_slots.include?(attempt)
      if size.times.map { |s| taken_slots.include? attempt + s }.include? true
        #puts "doesn't fit"
      else
        puts "found a fit down! #{index_to_time attempt}"
        return attempt
      end
    end
    search_down(taken_slots, size, attempt)
  end

  def entry_hour(entry)
    entry.time.hour + (entry.time.min / 60.0)
  end

  def each_entry_block(entry, &blk)
    (entry.minutes / 15).times.map do |n|
      entry_hour(entry)
      blk.call(entry_hour(entry) + ((n * 15) / 60.0))
    end
  end

end
