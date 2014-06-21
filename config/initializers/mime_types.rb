# move version number into the accept headers itself
Mime::Type.register "application/vnd.articles.v1+json", :articles_json_v1
Mime::Type.register "application/vnd.articles.v2+json", :articles_json_v2
Mime::Type.register "application/x-msgpack", :mpac

# add custom type for rendering in controllers
ActionController::Renderers.add :mpac do |mpac, options|
  self.content_type ||= Mime::MPAC
  mpac.respond_to?(:to_mpac) ? mpac.to_mpac(options) : mpac
end
