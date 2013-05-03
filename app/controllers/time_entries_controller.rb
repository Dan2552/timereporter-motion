class TimeEntriesController < BaseViewController
  extend IB
  include TimeEntriesHelper

  attr_accessor :selected_date, :deck_controller

  outlet :calendar_view
  outlet :date_navigation_bar

  def self.present(sender)
    center = self.from_storyboard
    left = LeftMenuController.from_storyboard
    deck_controller = IIViewDeckController.alloc.initWithCenterViewController(center, leftViewController:left, rightViewController:nil)
    deck_controller.navigationControllerBehavior = IIViewDeckNavigationControllerIntegrated
    deck_controller.delegateMode = IIViewDeckDelegateAndSubControllers
    deck_controller.leftSize = 132
    deck_controller.centerhiddenInteractivity = IIViewDeckCenterHiddenNotUserInteractiveWithTapToClose
    center.deck_controller = deck_controller

    sender.navigationController.pushViewController(deck_controller, animated:true)
  end

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
      date_navigation_bar.title = "Today"
    else
      date_navigation_bar.title = formatted_date(selected_date)
    end
  end

  def refresh_time_entries
    TimeEntry.get(date: formatted_date(selected_date)) do |success|
      render_entries
    end
  end

  def render_entries
    calendar_view.set_children TimeEntry.all.to_a
  end

  def menu_button_pressed
    deck_controller.openLeftViewAnimated(true)
  end

end
