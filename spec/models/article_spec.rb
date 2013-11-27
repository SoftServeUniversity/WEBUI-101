require 'spec_helper'

describe Article do
  it { should validate_presence_of(:title) }

  describe 'add_to_menu scope' do
    it 'should return articles marked as add_to_menu' do
      article = FactoryGirl.create(:article)
      expect(Article.add_to_menu).to include(article)
    end

    it 'should not return articles unmarked as add_to_menu' do
      article = FactoryGirl.create(:article, add_to_menu: false)
      expect(Article.add_to_menu).not_to include(article)
    end
  end
end


