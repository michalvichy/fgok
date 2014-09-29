# Articles controller
class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = 'Article was successfully created.'
      respond_with(@article, location: @article)
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = 'Article was successfully updated.'
      respond_with(@article, location: @article)
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = 'Article was successfully deleted'
    respond_with(@article, location: articles_path)
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
