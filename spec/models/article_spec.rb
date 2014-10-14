require 'rails_helper'

RSpec.describe Article, type: :model do
  let!(:article) { create(:article) }
  describe 'is not valid when' do
    it 'title is empty' do
      article.update(title: nil)
      expect(article).not_to be_valid
    end

    it 'body id empty' do
      article.update(body: nil)
      expect(article).not_to be_valid
    end
  end
end
