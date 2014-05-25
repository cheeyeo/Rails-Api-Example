# move version number into the accept headers itself
Mime::Type.register "application/vnd.articles.v1+json", :articles_json_v1
Mime::Type.register "application/vnd.articles.v2+json", :articles_json_v2
