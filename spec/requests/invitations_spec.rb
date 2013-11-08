require 'spec_helper'
require 'faker'

describe 'Sending invitations' do
  context 'when user is admin' do
    it 'should be allowed' do
      visit_new_user_invitation_path
      fill_in 'Email', with: mail = Faker::Internet.email
      click_button 'Send invitation'
      page.should have_content("An invitation email has been sent to #{mail}.")
    end
  end

  context 'when user is not admin' do
    it 'should not be allowed' do
      visit_new_user_invitation_path(admin = false)
      page.should have_content('You are not allowed to invite new users.')
    end
  end
end
