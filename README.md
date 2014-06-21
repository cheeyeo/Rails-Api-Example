## Rails API Versioning Example

This is an example of establishing API versioning on top of an existing,
unversioned Rails API. versioned apis inside /api/v1 and /api/v2

If run within the browser, http://localhost:3000/api/articles, you will
only reach the default set inside routes.rb which is api v2 since it is relying on the headers.

To view the different versions, you need to use curl:

```
curl -H "Accept: application/vnd.articles.v1" http://localhost:3000/api/articles

curl -H "Accept: application/vnd.articles.v2" http://localhost:3000/api/articles
```

This is the github style api with version numbers.


## Also a a study

This is also a study on the size of a messagepack response versus
a typical json response.

There is a html page setup on the homepage which shows the outcome.

As of this writing, with only 2 articles, the messagepack response is
50% less than JSON response.


## Sample usage of MessagePack

```ruby
articles = []
articles << Article.new(123,'The Things')

obj = {articles: articles}
msg = MessagePack.pack(obj)

obj2 = MessagePack.unpack(msg) # get orig hash back
```
