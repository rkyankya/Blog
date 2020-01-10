class ArticlesController < ApplicationController
    include ArticlesHelper
    def index
        @articles = Article.all
    end
    def show
        @article = Article.find(params[:id])
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
            #title: params[:article][:title]
            #body: params[:article][:title])
        @article.save 
        redirect_to article_path(@article)
    end

    def destroy
        @article = Article.destroy(params[:id])
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        @article.update(article_params)

        flash.notice = "Article '#{@article.title}' Updated!"

        redirect_to article_path(@article)
    end

    def comment
        @comment = Comment.new
        @comment.article_id = @article.id
    end
end
