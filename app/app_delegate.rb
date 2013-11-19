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
    today = Time.now.beginning_of_day
    TimeEntry.create(time: today + 0.hours, minutes: 60)
    TimeEntry.create(time: today + 3.hours, minutes: 60)
    TimeEntry.create(time: today + 10.hours, minutes: 30)
  end
end
