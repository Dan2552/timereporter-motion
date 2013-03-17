class TimeEntriesController < UIViewController
  extend IB

  attr_accessor :selected_date

  outlet :selected_date_label

  def viewDidAppear(animated)
    super
    self.selected_date = NSDate.new
    update_date_label
  end

  def back_pressed
    self.selected_date = self.selected_date - 1.day
    update_date_label
  end

  def forward_pressed
    self.selected_date = self.selected_date + 1.day
    update_date_label
  end

  def update_date_label
    if self.selected_date.today?
      selected_date_label.text = "Today"
    else
      selected_date_label.text = "Not today"
    end
  end

end
