require 'spec_helper'

describe ApplicationHelper do
  describe '#property' do
    it{ expect(helper.property('')).to eq('') }
  end
end

