class CalendarGrid < UIView
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

  def grid
    24.times do |n|
      top = (n * hour_height) + half_hour_height
      grid_line "#a9a9a9", top
      grid_line "#eeeeee", top + half_hour_height
    end
  end

  def grid_line color, top
    rect = Rect(65, top, 230, 1)
    context = UIGraphicsGetCurrentContext()
    color = color.to_color.CGColor
    CGContextSetFillColorWithColor(context, color)
    CGContextSetStrokeColorWithColor(context, color)
    CGContextFillRect(context, rect)
  end

  def time_labels
    24.times do |n|
      rect = Rect(10, hour_height * n , 50, hour_height)
      add_label "#{hour_text(n)}", rect
    end
  end

  def add_label(text, rect)
    label = UILabel.alloc.initWithFrame rect
    label.text = text
    addSubview label
  end

  def hour_height
    45
  end

  def half_hour_height
    hour_height / 2
  end

end
