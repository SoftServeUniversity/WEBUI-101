require 'spec_helper'

describe "Exhibitions" do
  let(:user) { FactoryGirl.create(:user) }

  before(:each) do
    sign_in(user)
  end

  describe 'GET admin/exhibitions/:id' do
    let!(:exhibition) { FactoryGirl.create(:exhibition) }
    let!(:exhibit) { FactoryGirl.create(:exhibit) }

    before(:each) do
      visit admin_exhibition_path(exhibition)
    end

    it 'has area for displaying exhibits' do
      expect(page).to have_selector('.exhibits-list')
    end

    it 'has form for adding exhibits' do
      expect(page).to have_selector("form.edit_exhibition")
    end

    describe 'add exhibits' do
      before(:each) do
        visit admin_exhibition_path(exhibition)
        page.select "#{exhibit.id}", from: "exhibition_exhibit_ids"
        click_button('Update Exhibition')
      end

      it 'sets flash message' do
        expect(page).to have_selector('.alert-success')
      end

      it 'adds exhibit to exhibition' do
        expect(page).to have_content(exhibit.name)
      end

      it 'adds exhibit register number' do
        expect(page).to have_content(exhibit.registration_number)
      end

      it 'adds remove exhibit link' do
        expect(page).to have_link('remove exhibit')
      end

      it 'adds link to exhibit' do
        expect(page).to have_link(exhibit.name)
      end
    end

    describe 'remove exhibits' do
      before(:each) do
        exhibition.exhibits << exhibit
        visit admin_exhibition_path(exhibition)
        click_link('remove exhibit')
      end

      it 'removes exhibit from exhibition' do
        expect(page).to have_content('Add some exhibits first.')
      end

      it 'sets flash message' do
        expect(page).to have_selector('.alert-success')
      end
    end
  end

end


