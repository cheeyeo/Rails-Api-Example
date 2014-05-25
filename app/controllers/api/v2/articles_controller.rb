module Api
  module V2
    class ArticlesController < ApplicationController
      respond_to :articles_json_v2, :json

      def index
        articles = []
        articles << Article.new(123,'The Things')

        # without serializer
        # respond_with({articles: articles})

        respond_with(ArticlesSerializer.new(articles: articles))
      end
    end
  end
end
