require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  let(:valid_attributes) { { title: 'foo_title', body: 'foo_body' } }

  let(:invalid_attributes) { skip('in progress') }

  describe 'GET index' do
    it 'assigns all articles as @articles' do
      article = Article.create!
      get :index
      expect(assigns(:articles)).to eq([article])
    end
  end

  describe 'GET show' do
    it 'assigns the requested article as @article' do
      article = Article.create!
      get :show, id: article
      expect(assigns(:article)).to eq(article)
    end
  end

  describe 'GET new' do
    it 'assigns a new article as @article' do
      get :new
      expect(assigns(:article)).to be_a_new(Article)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested article as @article' do
      article = Article.create!
      get :edit, id: article
      expect(assigns(:article)).to eq(article)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Article' do
        expect {
          post :create, article: valid_attributes
        }.to change(Article, :count).by(1)
      end

      it 'assigns a newly created article as @article' do
        post :create, article: valid_attributes
        expect(assigns(:article)).to be_a(Article)
        expect(assigns(:article)).to be_persisted
      end

      it 'redirects to the created article' do
        post :create, article: valid_attributes
        expect(response).to redirect_to(Article.last)
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved article as @article' do
        post :create, article: invalid_attributes
        expect(assigns(:article)).to be_a_new(Article)
      end

      it 're-renders the "new" template' do
        post :create, article: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      let(:new_attributes) { skip('Add a hash of attributes for your model') }

      it 'updates the requested article' do
        article = Article.create!
        put :update, id: article, article: new_attributes
        article.reload
        skip('Add assertions for updated state')
      end

      it 'assigns the requested article as @article' do
        article = Article.create!
        put :update, id: article, article: valid_attributes
        expect(assigns(:article)).to eq(article)
      end

      it 'redirects to the article' do
        article = Article.create!
        put :update, id: article, article: valid_attributes
        expect(response).to redirect_to(article)
      end
    end

    describe 'with invalid params' do
      it 'assigns the article as @article' do
        article = Article.create!
        put :update, id: article, article: invalid_attributes
        expect(assigns(:article)).to eq(article)
      end

      it 're-renders the "edit" template' do
        article = Article.create!
        put :update, id: article, article: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested article' do
      article = Article.create!
      expect {
        delete :destroy, id: article
      }.to change(Article, :count).by(-1)
    end

    it 'redirects to the articles list' do
      article = Article.create!
      delete :destroy, id: article
      expect(response).to redirect_to(articles_url)
    end
  end
end
