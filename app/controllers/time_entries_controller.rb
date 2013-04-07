class TimeEntriesController < UIViewController
  extend IB
  include TimeEntriesHelper
  
  attr_accessor :selected_date

  outlet :selected_date_label
  outlet :calendar_view

  def viewDidAppear(animated)
    super
    self.selected_date = NSDate.new
    update_date_label
    render_entries
    refresh_time_entries
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
      selected_date_label.text = formatted_date(selected_date)
    end
  end

  def refresh_time_entries
    TimeEntry.get(date: formatted_date(selected_date)) do |success|
      render_entries
    end
  end

  def render_entries
    #calendar_view.draw_entry 
  end

end
