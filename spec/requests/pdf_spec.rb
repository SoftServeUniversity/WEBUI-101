require 'spec_helper'

describe 'Printable Info-Cards (PDF)' do
  let(:user) { FactoryGirl.create(:user) }
  let(:exhibition) { FactoryGirl.create(:exhibition) }


  before(:each) do
    sign_in(user)
    visit exhibition_path(exhibition)
  end

  subject { page }

  it { should have_link('Printable Info-Cards (PDF)') }

  describe 'Click on "Printable Info-Cards (PDF)" link' do
    it 'should render pdf' do
      click_link('Printable Info-Cards (PDF)')
      response_headers["Content-Type"].should == "application/pdf; charset=utf-8"
    end
  end
end
