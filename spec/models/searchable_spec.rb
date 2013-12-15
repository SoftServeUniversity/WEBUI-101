require 'spec_helper'

describe Searchable, 'module' do
  it 'has list of all searchable models' do
    const = Searchable.constants.collect {|const| Searchable.const_get(const) }
    expect(const.flatten).to eq([Exhibit, Exhibition, Article])
  end

  describe '.find' do
    context 'when there are hits' do
      let!(:exhibition) { FactoryGirl.create(:exhibition, name: 'sunspot') }
      let!(:exhibit) { FactoryGirl.create(:exhibit, name: 'sunspot') }
      let!(:article) { FactoryGirl.create(:article, title: 'sunspot') }

      it 'returns an array with found results' do
        expect(Searchable.find('sunspot')).to include(exhibition, exhibit, article)
      end

      it 'counts found results' do
        Searchable.find('sunspot')
        expect(Searchable.count_results).to eq(3)
      end
    end

    context 'when there are no hits' do
      it 'returns an empty array' do
        expect(Searchable.find('blah')).to be_empty
      end
    end
  end
end

