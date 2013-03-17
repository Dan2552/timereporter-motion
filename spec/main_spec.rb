describe "Application 'TimereporterMotion'" do
  before do
    @app = UIApplication.sharedApplication
  end

  it "has one window" do
    @app.windows.size.should == 1
  end

  it "has a table for each model" do
    AppDelegate::MODELS.each { |model| model.table_exists?.should == true }
  end
end
