require 'spec_helper'

describe ExhibitionPdf do
  let(:exhibition) { FactoryGirl.create(:exhibition) }
  let(:pdf) { ExhibitionPdf.new(exhibition) }

  it 'responds to methods' do
    pdf.should respond_to(:exhibition_name, :exhibition_address, :add_page_numbers, :exhibits)
  end

  it 'properly assigns exhibition' do
    pdf.exhibition.should eq(exhibition)
  end

  describe 'when initialized without exhibition' do
    let(:pdf) { ExhibitionPdf.new }
    it 'should raise an error when rendered' do
      expect do
        pdf.render
      end.to raise_error(ArgumentError)
    end
  end
end
