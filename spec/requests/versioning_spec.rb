require 'spec_helper'

describe 'Models versioning' do
  let(:user) { FactoryGirl.create :user }

  before(:each) do
    sign_in(user)
  end

  describe 'testing', versioning: true do
    let!(:exhibit) { FactoryGirl.create(:exhibit, name: 'scout') }

    it 'works' do
      visit admin_exhibit_versions_path(exhibit)
      expect(page).to have_content('scout')
    end
  end
end
