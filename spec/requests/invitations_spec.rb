require 'spec_helper'

describe 'Access to invitation form' do
  let(:user) { FactoryGirl.create(:user) }

  before(:each) do
    sign_in(user)
    visit new_admin_user_invitation_path
  end

  subject { page }

  context 'when user is admin' do
    it { should have_content('Send invitation') }
    it { should have_button('Send invitation') }
    it { has_field?('Email', type: 'email') }
  end

  context 'when user is not admin' do
    let(:user) { FactoryGirl.create(:user, admin: false) }
    it { should have_content('You are not allowed to invite new users.') }
  end
end

