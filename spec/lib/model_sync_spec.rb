describe "ModelSync" do
  extend WebStub::SpecHelpers

  before do
    class TestBase < ModelSync::Base
      columns name: :string
    end
    stub_web
  end

  describe "Base" do
    it "can be converted to Hash" do
      TestBase.new.to_hash.class.should == Hash
    end
  end

  describe "Fetcher" do
    before do
      @model = AppDelegate::MODELS.first
    end

    it "has an application wide host" do
      ModelSync::Store.host = "http://test"
      ModelSync::Store.host.should == "http://test"
    end

    it "fetches an index for a model" do
      TestBase.fetchIndex

      # wait 1.0 do
      #   TestBase.all.count.should eq 2
      #   TestBase.first.class.should eq TestBase
      # end
    end
  end

  describe "Network" do

    before do
    end

    it "parses json response of a remote page" do
      json_response = nil
      ModelSync::Network.request("http://test/test_bases", lambda {
        |request, response, json|
        json_response = json
        resume
      }, lambda {
        |request, response, error, json|
        resume
      })

      wait_max 1.0 do
        json_response.class.should == Array
        json_response.count.should == 2
      end
    end
  end
end

def stub_web
  response = [TestBase.new(id: 1, name: "a").to_hash, TestBase.new(id: 2, name: "b").to_hash]
  stub_request(:get, "http://#{ModelSync::Store.host}/test_bases").to_return(json: response, body: response, delay: 0.3, content_type: "application/json")
end
