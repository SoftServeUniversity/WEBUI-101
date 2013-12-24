require 'spec_helper'

describe VersionsHelper do
  describe '#change_set_value' do
    it 'returns passed value if it is not nil or empty' do
      expect(helper.change_set_value('albaverde')).to eq('albaverde')
    end
    it "returns 'No previous value.' if value passed is nil" do
      expect(helper.change_set_value(nil)).to eq('No previous value.')
    end
    it "returns 'No previous value.' if value passed is empty string" do
      expect(helper.change_set_value('')).to eq('No previous value.')
    end
  end
end
