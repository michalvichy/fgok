require 'rails_helper'

RSpec.describe Dashboard::ArticlesController, type: :controller do
  let(:valid_attributes) { { title: 'Foobar', body: 'Lorem ipsum' } }

  let(:invalid_attributes) { { title: nil, body: nil } }

  let!(:article) { create(:article) }

  describe 'GET index' do
    it 'assigns all dashboard_articles as @dashboard_articles' do
      get :index
      expect(assigns(:articles)).to eq([article])
    end

    it 'render template "index"' do
      get :index
      expect(response).to render_template('index')
    end

    fit 'assigns last article as a first' do
      create(:article)
      get :index
      expect(assigns(:articles).first).to eq Article.last
    end
  end

  describe 'GET show' do
    it 'assigns the requested dashboard_article as @article' do
      get :show, id: article
      expect(assigns(:article)).to eq(article)
    end
  end

  describe 'GET new' do
    it 'assigns a new dashboard_article as @dashboard_article' do
      get :new
      expect(assigns(:article)).to be_a_new(Article)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested dashboard_article as @dashboard_article' do
      get :edit, id: article
      expect(assigns(:article)).to eq(article)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Article' do
        expect do
          post :create, article: valid_attributes
        end.to change(Article, :count).by(1)
      end

      it 'assigns a newly created dashboard_article as @article' do
        post :create, article: valid_attributes
        expect(assigns(:article)).to be_a(Article)
        expect(assigns(:article)).to be_persisted
      end

      it 'redirects to the created dashboard_article' do
        post :create, article: valid_attributes
        expect(response).to redirect_to(dashboard_article_path(Article.last))
      end
    end

    describe 'with invalid params' do
      xit 'assigns dashboard_article as @dashboard_article' do
        post :create, article: invalid_attributes
        expect(assigns(:dashboard_article)).to be_a_new(Article)
      end

      xit 're-renders the "new" template' do
        post :create, article: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      let(:new_attributes) { { title: 'BarFoo', body: 'Ipsum lorem' } }

      before do
        put :update, id: article, article: new_attributes
      end

      it 'updates the requested dashboard_article' do
        article.reload
        expect(assigns(:article).title).to eq new_attributes[:title]
        expect(assigns(:article).body).to eq new_attributes[:body]
        skip('Add assertions for updated state')
      end

      it 'assigns the requested dashboard_article as @dashboard_article' do
        expect(assigns(:article)).to eq(article)
      end

      it 'redirects to the dashboard_article' do
        expect(response).to redirect_to(dashboard_article_path(article))
      end
    end

    describe 'with invalid params' do
      before do
        put :update, id: article, article: invalid_attributes
      end

      it 'assigns the dashboard_article as @dashboard_article' do
        expect(assigns(:article)).to eq(article)
      end

      xit 're-renders the "edit" template' do
        put :update, id: article, article: invalid_attributes
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
      expect(response).to redirect_to(dashboard_articles_path)
    end
  end
end
