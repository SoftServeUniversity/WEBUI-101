require 'spec_helper'

describe "Exhibitions" do
  describe "GET /exhibitions" do
    let!(:user){ FactoryGirl.create(:user) }
    before do
      sign_in(user)
    end
    xit "works! (now write some real specs)", js: true do
      visit exhibitions_path
      binding.pry
      response.status.should be(200)
    end
  end
end
