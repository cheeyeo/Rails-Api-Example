module Api
  module V2
    class ArticlesController < ApplicationController
      def index
        articles = []

        50000.times do |i|
          articles << Article.new(i, "Article #{i}")
        end

        respond_to do |format|
          format.articles_json_v2{ render :json => ArticlesSerializer.new(articles: articles) }
          format.json { render :json => ArticlesSerializer.new(articles: articles) }
          format.mpac{ render :mpac => {articles: articles}.to_msgpack }
        end
      end
    end
  end
end
