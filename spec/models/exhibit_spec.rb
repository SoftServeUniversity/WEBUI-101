require 'spec_helper'

describe Exhibit do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:registration_number) }
  it { should respond_to(:available) }

  describe 'available scope' do
    it 'should return exhibits marked as available' do
      exhibit = FactoryGirl.create(:exhibit)
      expect(Exhibit.available).to include(exhibit)
    end

    it 'should not return exhibits marked as unavailable' do
      exhibit = FactoryGirl.create(:exhibit, available: false)
      expect(Exhibit.available).not_to include(exhibit)
    end
  end

  describe '.to_label' do
    it 'should return name and registration_number' do
      exhibit = Exhibit.create(name: 'Old Mummy', registration_number: '5000')
      expect(exhibit.to_label).to include('Old Mummy | registration number: 5000')
    end
  end
end
