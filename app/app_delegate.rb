class AppDelegate

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    setup_sync
    setup_database
    setup_window
    true
  end

  def setup_sync
    SyncModel::Settings.host = "http://time.alliants.co.uk"
    SyncModel::Settings.auth_action = -> { User.login }
  end

  def setup_database
    documents_path         = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true)[0]
    NanoStore.shared_store = NanoStore.store(:file, documents_path + "/nano.db")
  end

  def setup_window
    @window = UIWindow.alloc.initWithFrame UIScreen.mainScreen.bounds
    storyboard = UIStoryboard.storyboardWithName "Storyboard", bundle: nil
    @window.rootViewController = storyboard.instantiateInitialViewController
    @window.makeKeyAndVisible
  end
end
