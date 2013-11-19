require 'spec_helper'

describe "Exhibitions" do
  describe "GET /exhibitions" do
    let!(:user){ FactoryGirl.create(:user) }
    before do
      sign_in(user)
    end
    it "works! (now write some real specs)" do
      visit exhibitions_path

      page.status_code.should be(200)
    end
  end
end
