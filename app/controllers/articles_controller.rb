class ArticlesController < ApplicationController
  # useful: convention for order of methods in all controller classes - index, show, new, edit, create, update, destroy
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    # useful: Article.new returns true or false... based on the validates section in corresponding models
    if @article.save
      redirect_to @article
    else
      # useful: use render instead of redirect_to in order to avoid issuing another request for a new article from the server
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
    def article_params
      # params.require forces :article to only accept permit(*contents*)... self reminder for future projects!
      params.require(:article).permit(:title, :text)
    end
end
