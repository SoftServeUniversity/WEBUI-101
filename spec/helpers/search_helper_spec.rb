require 'spec_helper'

describe SearchHelper do
  describe '#partial_for' do
    context 'Exhibit' do
      it{ expect(helper.partial_for(stub_model(Exhibit))).to eq('search/exhibit') }
    end

    context 'Exhibition' do
      it{ expect(helper.partial_for(stub_model(Exhibition))).to eq('search/exhibition') }
    end

    context 'Article' do
      it{ expect(helper.partial_for(stub_model(Article))).to eq('search/article') }
    end
  end
end
