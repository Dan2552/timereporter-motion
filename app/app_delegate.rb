class AppDelegate
  @@nui_settings = NUISettings.initWithStylesheet("theme")
  MODELS = [TimeEntry, User]

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @nui = NUIAppearance.init
    setup_sync
    setup_database
    setup_window
    true
  end

  def setup_sync
    ModelSync::Store.host = "http://Daniel.local:3000"
    ModelSync::Store.auth_action = -> { User.login }
  end

  def setup_database
    db = 'data.db'
    db = 'test.db' if RUBYMOTION_ENV == 'test'
    MotionModel::Store.config(MotionModel::FMDBAdapter.new(db))
    MODELS.each do |model|
      model.create_table unless model.table_exists?
    end
  end

  def setup_window
    @window = UIWindow.alloc.initWithFrame UIScreen.mainScreen.bounds
    storyboard = UIStoryboard.storyboardWithName "Storyboard", bundle: nil
    @window.rootViewController = storyboard.instantiateInitialViewController
    @window.makeKeyAndVisible
  end
end
