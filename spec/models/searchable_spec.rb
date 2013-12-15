require 'spec_helper'

describe Searchable, 'module' do
  it 'has list of all searchable models' do
    const = Searchable.constants.collect {|const| Searchable.const_get(const) }
    expect(const.flatten).to eq([Exhibit, Exhibition, Article])
  end

  describe '.find' do
    it 'sends search message to each model' do
      [Exhibition, Exhibit, Article].each do |model|
        model.stub_chain(:search, :results).and_return([])
        model.should_receive(:search)
        Searchable.find('hello')
      end
    end

    it 'counts found results' do
      [Exhibition, Exhibit, Article].each do |model|
        model.stub_chain(:search, :results).and_return([])
        model.stub_chain(:search, :results, :count).and_return(1)
      end
      Searchable.find('sunspot')
      expect(Searchable.count_results).to eq(3)
    end
  end
end
