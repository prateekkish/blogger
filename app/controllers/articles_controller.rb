class ArticlesController < ApplicationController
  include ArticlesHelper
  before_action :set_article, only: [:show,:edit, :update,:destroy]
  def index
    @articles = Article.all
  end
  def show
    @comment = Comment.new
    @comment.article = @article
  end
  def new
    @article = Article.new
  end
  def create
    @article = Article.new(article_params)
    @article.save
    flash.notice = "Article created successfully"
    redirect_to article_path(@article)
  end
  def edit
  end
  def update
    @article.update(article_params)
    flash.notice = "Article #{@article.title} updated successfully!"
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    flash.notice = "Article destroyed"
    redirect_to articles_path
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end
end
