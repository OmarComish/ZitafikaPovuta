class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] ="Article has been created"
      redirect_to articles_path
    else
      flash.now[:danger] = "Could not create article"
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
       flash[:success]= "Article has been created"
       redirect_to @article
    else
      flash.now[:danger] ="Could not update article"
      render :edit
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      flash[:success]= "Article has been deleted"
      redirect_to articles_path
    end
  end

  private
  
  def article_params
    params.require(:article).permit(:title, :body)
  end
end
