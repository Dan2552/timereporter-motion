class TimeEntryView < UIView

  def initialize entry
    @time_entry = time_entry
    size_to_time_entry
  end

  def size_to_time_entry
    rect = CGRectMake(grid_left, top_for_hour(2.5), grid_width, hour_height(time_entry.duration))  
    frame = rect
  end

  def drawRect rect
    #layer.cornerRadius = 3
    #layer.masksToBounds = true
    load_xib
    layer.masksToBounds = true
  end

  def load_xib
    child = NSBundle.mainBundle.loadNibNamed("TimeEntryView", owner:self, options:nil).objectAtIndex(0)
    child.layer.borderColor = "#2a5430".uicolor.CGColor
    child.layer.borderWidth = 1.0
    child.layer.cornerRadius = 3
    child.layer.masksToBounds = true
    child.frame = CGRectMake(0, 0, frame.size.width, frame.size.height)
    self.addSubview(child)
  end

  def label
    viewWithTag(1)
  end

end

