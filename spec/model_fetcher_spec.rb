describe "Modelfetcher" do
  before do
    @fetcher = ModelSync::Fetcher.new
  end

  it "does something" do
    @fetcher.do_something.should == true
  end
end
