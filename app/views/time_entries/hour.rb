class TimeViewHour < TimeViewBase

  def hour= hour
    views = self.subviews.select {|v| v.is_a? UILabel }
    views.each {|v| v.text = "#{hour}:00" }
  end

end
