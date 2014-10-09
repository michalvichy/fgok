# Dashboard article controller
class Dashboard::ArticlesController < DashboardsController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

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
    @article = Article.new(dashboard_article_params)
    if @article.save
      redirect_to dashboard_article_path(@article)
      flash[:notice] = 'Utworzono nowy artykuł'
    else
      render :new
    end
  end

  def update
    if @article.update(dashboard_article_params)
      redirect_to dashboard_article_path(@article)
      flash[:notice] = 'Artykuł zaktualizowany'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to dashboard_articles_path
    flash[:notice] = 'Artykuł został usunięty'
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def dashboard_article_params
    params.require(:article).permit(:title, :body)
  end
end
