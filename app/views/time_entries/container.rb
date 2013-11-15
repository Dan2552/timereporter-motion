class TimeViewContainer < UIScrollView

  attr_accessor :data_source, :reusable_hour_view, :reusable_time_entry_view

  def hour_height
    self.reusable_hour_view.try(:height) || 0
  end

  def setup_frame
    height = hour_height * 24
    #self.frame = #[[self.x, self.y], [self.width, height]]

    #if self.superview.is_a? UIScrollView
      self.contentSize = [self.width, height]
    #end
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
    setup_frame
    self.subviews.each { |v| v.removeFromSuperview }
    24.times do |n|
      new_hour(
        y: n * hour_height,
        hour: n
      )
    end

    load_data if data_source
  end

  def load_data
    puts "loading #{data_source.entry_view_data.count} entries"
    data_source.entry_view_data.each do |entry|
      entry_hour = entry.time.hour + (entry.time.min / 60.0)
      duration_in_hours = entry.minutes / 60.0
      new_entry(
        y: 10 + (entry_hour * hour_height),
        height: duration_in_hours * hour_height,
        text: "Apples - #{duration_in_hours}"
      )
    end
  end

  def new_entry(options)
    view = self.reusable_time_entry_view.reuse(options)
    view.hidden = false
    view.clipsToBounds = true
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

end
