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

  describe '.unavailability' do
    let(:exhibit) { FactoryGirl.create(:exhibit) }
    let!(:exhibition1) { FactoryGirl.create(:exhibition, start_date: '01-11-2013', end_date: '30-11-2013') }
    let!(:exhibition2) { FactoryGirl.create(:exhibition, start_date: '01-12-2013', end_date: '30-12-2013') }
    let!(:exhibition3) { FactoryGirl.create(:exhibition, start_date: '01-01-2014', end_date: '30-01-2014') }

    it 'returns empty array when no exhibitions' do
      expect(exhibit.unavailability).to eq([])
    end

    it 'returns array of exhibition time period where exhibition include exhibit' do
      exhibition1.exhibits << exhibit
      exhibition3.exhibits << exhibit
      expect(exhibit.unavailability).to eq([(exhibition1.start_date..exhibition1.end_date), (exhibition3.start_date..exhibition3.end_date)])
    end

    context 'when exhibits exhibition is virtual' do
      let!(:exhibition4) { FactoryGirl.create(:exhibition, start_date: '01-11-2014', end_date: '30-11-2014', virtual: true)}

      it "doesn't include exhibitions start_date and end_date" do
        exhibition4.exhibits << exhibit
        expect(exhibit.unavailability).not_to include((exhibition4.start_date..exhibition4.end_date))
      end
    end
  end

  describe '.available_for_dates?' do
    let(:exhibit) { FactoryGirl.build(:exhibit) }
    let(:exhibition) { FactoryGirl.create(:exhibition, virtual: false) }


    it 'returns false when available flag is false' do
      expect(FactoryGirl.build(:exhibit, available: false).available_for_dates?(Date.today, Date.today, exhibition)).to be_false
    end

    it 'returns true when entered data range is not in unavailability list' do
      expect(exhibit).to receive(:unavailability).and_return([])
      expect(exhibit.available_for_dates?(Date.today, Date.today + 1.day, exhibition)).to be_true
    end

    it 'returns false when entered date range is in unavailability list' do
      expect(exhibit).to receive(:unavailability).and_return([(Date.today..Date.today + 1.day)])
      expect(exhibit.available_for_dates?(Date.today, Date.today + 1.day, exhibition)).to be_false
    end

    context 'when exhibition is virtual' do
      let(:exhibition) { FactoryGirl.create(:exhibition, virtual: true) }
      it 'returns true' do
        expect(exhibit.available_for_dates?(Date.today, Date.today + 1.day, exhibition)).to be_true
      end
    end
  end


end
