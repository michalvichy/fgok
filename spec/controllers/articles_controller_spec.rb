require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  let(:article) { create(:article) }

  describe 'GET index' do
    it 'assigns all articles as @articles' do
      get :index
      expect(assigns(:articles)).to eq([article])
    end
  end

  describe 'GET show' do
    it 'assigns the requested article as @article' do
      get :show, id: article
      expect(assigns(:article)).to eq(article)
    end
  end
end
