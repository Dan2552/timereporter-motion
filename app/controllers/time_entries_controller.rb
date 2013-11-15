class TimeEntriesController < BaseViewController
  extend IB
  include TimeEntriesHelper

  attr_accessor :selected_date, :deck_controller

  outlet :reusable_hour_view
  outlet :reusable_time_entry_view
  outlet :date_label_button
  outlet :entry_view

  def viewDidAppear(animated)
    super
    setup_entry_view
    refresh_time_entries
  end

  def setup_entry_view
    entry_view.reusable_hour_view = reusable_hour_view
    entry_view.reusable_time_entry_view = reusable_time_entry_view
    entry_view.data_source = self
  end

  def selected_date
    @selected_date ||= NSDate.new
  end

  def back_pressed
    update_selected_date(self.selected_date - 1.day)
  end

  def forward_pressed
    update_selected_date(self.selected_date + 1.day)
  end

  def update_selected_date(new_date)
    self.selected_date = new_date

    if selected_date.today?
      date_label_button.titleLabel.text = "Today"
    else
      date_label_button.titleLabel.text = formatted_date(selected_date)
    end

    entry_view.refresh
  end

  def refresh_time_entries
    TimeEntry.get(date: formatted_date(selected_date)) do |success|
      entry_view.refresh
    end
  end

  def menu_button_pressed
    deck_controller.openLeftViewAnimated(true)
  end

  def entry_view_data
    TimeEntry.for_date(self.selected_date, :day)
  end

end
