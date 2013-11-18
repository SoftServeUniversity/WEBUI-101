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
    let!(:available_exhibit) { FactoryGirl.create(:exhibit) }
    let!(:unavailable_exhibit) { FactoryGirl.create(:exhibit, available: false) }

    it "should not include exhibit if it's already included in exhibition" do
      exhibition.exhibits << available_exhibit
      exhibition.exhibits << unavailable_exhibit

      expect(exhibition.available_exhibits).not_to include(available_exhibit, unavailable_exhibit)
    end


    context 'when exhibition is virtual' do
      it 'should include available exhibits' do
        expect(exhibition.available_exhibits).to include(available_exhibit)
      end

      it 'should include unavailable exhibits' do
        expect(exhibition.available_exhibits).to include(unavailable_exhibit)
      end
    end

    context 'when exhibition is not virtual' do
      let!(:exhibition) { FactoryGirl.create(:exhibition, virtual: false) }

      it 'should include available exhibits' do
        expect(exhibition.available_exhibits).to include(available_exhibit)
      end

      it 'should not include unavailable exhibits' do
        expect(exhibition.available_exhibits).not_to include(unavailable_exhibit)
      end
    end
  end
end
