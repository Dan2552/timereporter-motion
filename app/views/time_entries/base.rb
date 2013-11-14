class TimeViewBase < UIView

  def reuse(options={})
    archivedView = NSKeyedArchiver.archivedDataWithRootObject(self)
    copy = NSKeyedUnarchiver.unarchiveObjectWithData(archivedView)
    options.each {|k, v| copy.send("#{k}=", v) }
    copy
  end

end
