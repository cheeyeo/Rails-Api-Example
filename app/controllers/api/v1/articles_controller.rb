module Api
  module V1
    class ArticlesController < ApplicationController
      respond_to :articles_json_v1, :json

      def index
        articles = [
          { id: 123, name: 'The Things' },
        ]

        respond_with(articles)
      end
    end
  end
end
