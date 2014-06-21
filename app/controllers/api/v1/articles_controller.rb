module Api
  module V1
    class ArticlesController < ApplicationController
      def index
        articles = []
        articles << Article.new(456,'The Things')

        respond_to do |format|
          format.articles_json_v1{ render :json => articles.to_json }
          format.json{ render :json => articles.to_json }
        end
      end
    end
  end
end
