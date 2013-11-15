class TimeViewEntry < TimeViewBase

  def text= text
    views = self.subviews.select {|v| v.is_a? UILabel }
    views.each {|v| v.text = text }
  end

end
