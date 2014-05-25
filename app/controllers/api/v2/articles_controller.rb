module Api
  module V2
    class ArticlesController < ApplicationController
      respond_to :articles_json_v2, :json

      def index
        articles = [
          { id: 123, name: 'The Things' },
        ]

        respond_with({articles: articles})
      end
    end
  end
end
