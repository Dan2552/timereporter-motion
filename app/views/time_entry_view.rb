class TimeEntryView < UIView
  include SugarCube::CoreGraphics

  def initWithFrame frame
    super.tap do
      setup_label
    end
  end

  def drawRect rect
    layer.backgroundColor = back_color.CGColor
    layer.borderColor = border_color.CGColor
    layer.borderWidth = 1.0
    layer.cornerRadius = 3
    layer.masksToBounds = true
  end

  def project_name= name
    @label.text = name
    update_label
  end

  private

  def setup_label
    @label = UILabel.alloc.initWithFrame [[5,0],[frame.size.width - 5, 30]]
    @label.backgroundColor = UIColor.clearColor
    @label.shadowOffset = [0, 1]
    @label.font = UIFont.fontWithName("Helvetica Neue", size: 14)
    update_label
    addSubview @label
  end

  def update_label
    @label.textColor = text_color
    @label.shadowColor = text_shadow
  end

  def back_color
    has_project? ? [42, 84, 48].uicolor(0.2) : [173, 39, 30].uicolor(0.4)
  end

  def border_color
    has_project? ? [42, 84, 48].uicolor : [173, 39, 30].uicolor
  end

  def text_color
    has_project? ? "#2A5430".uicolor : "#AD271E".uicolor
  end

  def text_shadow
    has_project? ? "#def4e1".uicolor : "#edc7c4".uicolor
  end

  def has_project?
    @label.text.present?
  end

end

