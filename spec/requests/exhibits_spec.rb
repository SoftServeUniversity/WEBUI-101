require 'spec_helper'

describe "Exhibits" do
  describe "GET /exhibits" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get exhibits_path
      response.status.should be(200)
    end
  end
end
