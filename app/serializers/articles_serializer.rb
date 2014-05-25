require 'oat/adapters/json_api'

class ArticlesSerializer < Oat::Serializer
  adapter Oat::Adapters::JsonAPI

  schema do
    type 'articles'
    collection :articles, item[:articles], ArticleSerializer
  end
end
