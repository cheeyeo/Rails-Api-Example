module Api
  module V2
    class ArticlesController < ApplicationController
      def index
        articles = []

        @article = Article.new(123,'The Things')
        @article2 = Article.new(456,'Some more Things')
        articles << @article
        articles << @article2

        respond_to do |format|
          format.articles_json_v2{ render :json => ArticlesSerializer.new(articles: articles) }
          format.json { render :json => ArticlesSerializer.new(articles: articles) }
          format.mpac{ render :mpac => articles.to_msgpack }
        end
      end
    end
  end
end
