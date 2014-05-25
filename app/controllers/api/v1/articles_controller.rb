module Api
  module V1
    class ArticlesController < ApplicationController
      respond_to :articles_json_v1, :json

      def index
        articles = []
        articles << Article.new(456,'The Things')

        # without serializer
        respond_with(articles)
      end
    end
  end
end
