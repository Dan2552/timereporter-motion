class TimeEntriesController < BaseViewController
  extend IB
  include TimeEntriesHelper

  attr_accessor :selected_date, :deck_controller

  outlet :calendar_view
  outlet :date_label_button


  def viewDidAppear(animated)
    super
    self.selected_date = NSDate.new
    #update_date_label
    render_entries
    refresh_time_entries
    debug self
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
      date_label_button.titleLabel.text = "Today"
    else
      date_label_button.titleLabel.text = formatted_date(selected_date)
    end
  end

  def refresh_time_entries
    TimeEntry.get(date: formatted_date(selected_date)) do |success|
      render_entries
    end
  end

  def render_entries
    calendar_view.set_children [TimeEntry.first]
  end

  def menu_button_pressed
    deck_controller.openLeftViewAnimated(true)
  end

end
