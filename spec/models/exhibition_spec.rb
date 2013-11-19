# == Schema Information
#
# Table name: exhibitions
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  start_date  :date
#  end_date    :date
#  adress      :string(255)
#  latitude    :float
#  longitude   :float
#  virtual     :boolean
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Exhibition do
  it{ should validate_presence_of :name }
  it{ should validate_presence_of :adress }

  describe '#start_date_cannot_be_later_than_end_date' do
    let(:exhibition){ Exhibition.new(name: 'a', adress: 'b') }
    it 'pass when no dates available' do
      expect(exhibition).to be_valid
    end

    it 'pass when start date equals end date' do
      exhibition.start_date = '07-03-1985'
      exhibition.end_date = '07-03-1985'
      expect(exhibition).to be_valid
    end

    it 'not pass when start date is greater than end date' do
      exhibition.start_date = '08-03-1985'
      exhibition.end_date = '07-03-1985'
      expect(exhibition).to_not be_valid
    end

    it 'pass when start date is less than end date' do
      exhibition.start_date = '06-03-1985'
      exhibition.end_date = '07-03-1985'
      expect(exhibition).to be_valid
    end

  end

  describe '.available_exhibits' do
    let!(:exhibition) { FactoryGirl.create(:exhibition, virtual: true) }
    let!(:exhibit1) { FactoryGirl.create(:exhibit) }
    let!(:exhibit2) { FactoryGirl.create(:exhibit) }

    it "should not include exhibit if it's already included in exhibition" do
      exhibition.exhibits << exhibit1

      expect(exhibition.available_exhibits).not_to include(exhibit1)
    end
  end
end
