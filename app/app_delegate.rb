class AppDelegate
  MODELS = [Hello]

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    setup_database
    setup_window
    true
  end

  def setup_database
    MotionModel::Store.config(MotionModel::FMDBAdapter.new('test.db'))
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
