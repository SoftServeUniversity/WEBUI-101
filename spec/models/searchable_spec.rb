require 'spec_helper'

describe Searchable, 'module' do
  it 'has list of all searchable models' do
    const = Searchable.constants.collect {|const| Searchable.const_get(const) }
    expect(const.flatten).to eq([Exhibit, Exhibition, Article])
  end
end
