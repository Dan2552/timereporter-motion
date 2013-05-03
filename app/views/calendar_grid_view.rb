class CalendarGridView < UIView
  include SugarCube::CoreGraphics
  include TimeEntriesHelper

  def initWithCoder coder
    super
  end

  def drawRect rect
    grid
    time_labels
    if superview.is_a? UIScrollView
      superview.contentSize = frame.size
    end

    super
  end

  def set_children time_entries=[]
    remove_children
    time_entries.each { |entry| add_child(entry) }
  end

  def hour_height n=1
    45 * n
  end

  def grid_width
    230
  end

  private

  def children
    @children = @children || []
  end

  def add_child time_entry
    position = [grid_left, top_for_date(time_entry.entry_datetime)]
    size = [grid_width, hour_height(time_entry.duration_in_hours)]


    sv = TimeEntryView.alloc.initWithFrame(Rect(position, size))
    sv.backgroundColor = UIColor.clearColor
    sv.project_name = "test"

    addSubview(sv)
    children << sv
  end

  def top_for_date date
    hour = date.hour + (date.min / 60.0)
    top_for_hour hour
  end

  def grid
    24.times do |n|
      top = top_for_hour n
      grid_line "#a9a9a9", top
      grid_line "#eeeeee", top + half_hour_height
    end
  end

  def top_for_hour hour
    top = hour_height(hour) + half_hour_height
  end

  def grid_line color, top
    rect = Rect(grid_left, top, grid_width, 1)
    context = UIGraphicsGetCurrentContext()
    color = color.to_color.CGColor
    CGContextSetFillColorWithColor(context, color)
    CGContextSetStrokeColorWithColor(context, color)
    CGContextFillRect(context, rect)
  end

  def time_labels
    24.times do |n|
      rect = Rect(10, hour_height(n) , 50, hour_height)
      add_label "#{hour_text(n)}", rect
    end
  end

  def add_label(text, rect)
    label = UILabel.alloc.initWithFrame rect
    label.text = text
    addSubview label
  end

  def half_hour_height
    hour_height / 2
  end

  def grid_left
    65
  end

  def remove_children
    children.each { |subview| subview.removeFromSuperview }
    children.clear
  end

end
