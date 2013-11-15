class AppDelegate

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    setup_sync
    setup_database
    setup_window unless RUBYMOTION_ENV == 'test'
    test_seed #todo: remove me
    true
  end

  def setup_sync
    SyncModel::Settings.host = "http://0.0.0.0:3000"
    SyncModel::Settings.auth_action = -> { }
  end

  def setup_database
    documents_path         = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true)[0]
    NanoStore.shared_store = NanoStore.store(:file, documents_path + "/#{RUBYMOTION_ENV}.db")
  end

  def setup_window
    @window = UIWindow.alloc.initWithFrame UIScreen.mainScreen.bounds
    storyboard = UIStoryboard.storyboardWithName "Storyboard", bundle: nil
    @window.rootViewController = storyboard.instantiateInitialViewController

    @window.rootViewController.navigationBar.setBackgroundImage(
      UIImage.imageNamed("primary_color.png"),
      forBarMetrics:UIBarMetricsDefault
    )


    @window.makeKeyAndVisible
  end

  def test_seed
    TimeEntry.delete_all
    @monday = Time.now.beginning_of_week
    @tuesday = @monday + 1.day
    @wednes = @tuesday + 1.day
    TimeEntry.create(time: @tuesday + 1.hours, minutes: 120)
    TimeEntry.create(time: @tuesday + 3.hours, minutes: 30)
    TimeEntry.create(time: @tuesday + 6.hours, minutes: 45)
    TimeEntry.create(time: @monday, minutes: 60)
    TimeEntry.create(time: @wednes + 16.hours, minutes: 60*3)
    TimeEntry.create(time: @wednes + 15.minutes, minutes: 60)
    TimeEntry.create(time: @wednes + 1.day + 1.hours, minutes: 120)
    TimeEntry.create(time: @wednes + 1.day + 3.hours, minutes: 30)
    TimeEntry.create(time: @wednes + + 2.days + 6.hours, minutes: 45)
    TimeEntry.create(time: @wednes + 2.days, minutes: 60)
    TimeEntry.create(time: @wednes + 2.days + 16.hours, minutes: 60*3)
  end
end
