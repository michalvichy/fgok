# Dashboard article controller
class Dashboard::ArticlesController < DashboardsController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @dashboard_articles = Article.all
  end

  def show
  end

  def new
    @dashboard_article = Article.new
  end

  def edit
  end

  def create
    @dashboard_article = Article.new(dashboard_article_params)
    if @dashboard_article.save
      redirect_to @dashboard_article, notice: 'Utworzono nowy artykuł'
    else
      render :new
    end
  end

  def update
    if @dashboard_article.update(dashboard_article_params)
      redirect_to @dashboard_article, notice: 'Artykuł zaktualizowany'
    else
      render :edit
    end
  end

  def destroy
    @dashboard_article.destroy
    redirect_to dashboard_articles_url, notice: 'Artykuł został usunięty'
  end

  private

  def set_article
    @dashboard_article = Article.find(params[:id])
  end

  def dashboard_article_params
    params.require(:dashboard_article).permit(:title, :body)
  end
end
