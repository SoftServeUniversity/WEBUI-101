require 'spec_helper'

describe 'Models versioning' do
  let(:user) { FactoryGirl.create :user }
  let(:exhibit) { FactoryGirl.create(:exhibit, name: 'scout') }

  before do
    sign_in(user)
  end

  context 'when no previous version', versioning: true do

    before(:each) do
      visit admin_exhibit_versions_path(exhibit)
    end

    it 'displays models version'  do
      expect(page).to have_content('scout')
    end

    it 'redirects to admin root'  do
      click_link('Revert')
      expect(current_path).to eq(admin_root_path)
    end

    it 'set flash message' do
      click_link('Revert')
      expect(page).to have_content /Exhibit was destroyed. To restore deleted item use the following link/
    end

    it 'has revert link' do
      click_link('Revert')
      expect(page).to have_link('Revert')
    end

    it "deletes model from the data base" do
      expect{click_link('Revert')}.to change{ Exhibit.count }.by(-1)
    end

    it "restores model in the data base" do
       click_link('Revert')
       expect{ click_link('Revert') }.to change{ Exhibit.count }.by(1)
    end
  end

  context 'with previous version', versioning:true do

    before(:each) do
      exhibit.update_attribute('name', 'updated')
      visit admin_exhibit_versions_path(exhibit)
    end

    it 'creates new version for a model' do
      expect{ page.first('.btn').click }.to change{ exhibit.versions.count }.by(1)
    end

    it 'shows changed values' do
      expect(page).to have_content /scout updated/
    end

    it 'set flash message' do
      page.first('.btn').click
      expect(page).to have_content('Undid update.')
    end

    it 'redirects to item versions page' do
      page.first('.btn').click
      expect(current_path).to eq admin_exhibit_versions_path(exhibit)
    end
  end
end
