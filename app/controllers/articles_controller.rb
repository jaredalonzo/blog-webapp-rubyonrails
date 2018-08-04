class ArticlesController < ApplicationController
  # useful: convention for order of methods in all controller classes - index, show, new, edit, create, update, destroy
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def create
    @article = Article.new(article_params)

    @article.save
    redirect_to @article
  end

  private
    def article_params
      # params.require forces :article to only accept permit(*contents*)... self reminder for future projects!
      params.require(:article).permit(:title, :text)
    end
end
