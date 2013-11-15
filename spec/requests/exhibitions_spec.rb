require 'spec_helper'

describe "Exhibitions" do
  describe "GET /exhibitions" do
    let!(:user){ FactoryGirl.create(:user) }
    before do
      sign_in(user)
    end
    it "works! (now write some real specs)", js: true do
      visit exhibitions_path

      response.status.should be(200)
    end
  end
end
