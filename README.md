## Rails API Versionin Example

This is an example of establishing API versioning on top of an existing,
unversioned Rails API. versioned apis inside /api/v1 and /api/v2

If run within the browser, http://localhost:3000/api/articles, you will
only reach the default set inside routes.rb which is api v2 since it is relying on the headers.

To view the different versions, you need to use curl:

```
curl -H "Accept: application/vnd.articles.v1" http://localhost:3000/api/articles

curl -H "Accept: application/vnd.articles.v2" http://localhost:3000/api/articles
```

This follows the style of github api with versioning.


## Also a a study

This is also a study on the size of a messagepack response versus
a typical json response.

There is a html page setup on the homepage which shows the outcome.

As of this writing, with only 2 articles, the messagepack response is
50% less than JSON response.

With 50000 articles, the response times are as follows:

```
`Request Format: MPAC`
Path: /api/articles.mpac
`Page Duration: 178.8ms`
`View Duration: 0.2ms`
DB Duration: 0.0ms
Completed 200 OK in 179ms (Views: 0.2ms | ActiveRecord: 0.0ms)

`Request Format: JSON`
Path: /api/articles
`Page Duration: 4023.4ms`
`View Duration: 3921.7ms`
DB Duration: 0.0ms
Completed 200 OK in 4023ms (Views: 3921.7ms | ActiveRecord: 0.0ms)
```

The code to generate the notification is in config/initializers/notifications.rb


## Sample usage of MessagePack

```ruby
articles = []
articles << Article.new(123,'The Things')

obj = {articles: articles}
msg = MessagePack.pack(obj)

obj2 = MessagePack.unpack(msg) # get orig hash back
```

## TODO

* Use ActiveSupport notifications to measure run times ?
