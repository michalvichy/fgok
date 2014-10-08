require 'rails_helper'

RSpec.describe Dashboard::ArticlesController, type: :controller do
  let(:valid_attributes) { { title: 'Foobar', body: 'Lorem ipsum' } }

  let(:invalid_attributes) { { title: nil, body: nil } }

  let!(:article) { create(:article) }

  describe 'GET index' do
    it 'assigns all dashboard_articles as @dashboard_articles' do
      get :index
      expect(assigns(:dashboard_articles)).to eq([article])
    end
  end

  describe 'GET show' do
    it 'assigns the requested dashboard_article as @article' do
      get :show, id: article
      expect(assigns(:dashboard_article)).to eq(article)
    end
  end

  describe 'GET new' do
    it 'assigns a new dashboard_article as @dashboard_article' do
      get :new
      expect(assigns(:dashboard_article)).to be_a_new(Article)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested dashboard_article as @dashboard_article' do
      get :edit, id: article
      expect(assigns(:dashboard_article)).to eq(article)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Article' do
        expect do
          post :create, dashboard_article: valid_attributes
        end.to change(Article, :count).by(1)
      end

      it 'assigns a newly created dashboard_article as @dashboard_article' do
        post :create, dashboard_article: valid_attributes
        expect(assigns(:dashboard_article)).to be_a(Article)
        expect(assigns(:dashboard_article)).to be_persisted
      end

      it 'redirects to the created dashboard_article' do
        post :create, dashboard_article: valid_attributes
        expect(response).to redirect_to(Article.last)
      end
    end

    describe 'with invalid params' do
      xit 'assigns dashboard_article as @dashboard_article' do
        post :create, dashboard_article: invalid_attributes
        expect(assigns(:dashboard_article)).to be_a_new(Article)
      end

      xit 're-renders the "new" template' do
        post :create, dashboard_article: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      let(:new_attributes) { { title: 'BarFoo', title: 'Ipsum lorem' } }

      it 'updates the requested dashboard_article' do
        put :update, id: article, dashboard_article: new_attributes
        article.reload
        skip('Add assertions for updated state')
      end

      it 'assigns the requested dashboard_article as @dashboard_article' do
        put :update, id: article, dashboard_article: valid_attributes
        expect(assigns(:dashboard_article)).to eq(article)
      end

      it 'redirects to the dashboard_article' do
        put :update, id: article, dashboard_article: valid_attributes
        expect(response).to redirect_to(article)
      end
    end

    describe 'with invalid params' do
      it 'assigns the dashboard_article as @dashboard_article' do
        put :update, id: article, dashboard_article: invalid_attributes
        expect(assigns(:dashboard_article)).to eq(article)
      end

      xit 're-renders the "edit" template' do
        put :update, id: article, dashboard_article: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested dashboard_article' do
      expect do
        delete :destroy, id: article
      end.to change(Article, :count).by(-1)
    end

    it 'redirects to the dashboard_articles list' do
      delete :destroy, id: article
      expect(response).to redirect_to(dashboard_articles_url)
    end
  end
end
