require 'oat/adapters/json_api'

class ArticleSerializer < Oat::Serializer
  adapter Oat::Adapters::JsonAPI

  schema do
    type 'article'
    property :id, item.id
    property :name, item.name
  end
end
