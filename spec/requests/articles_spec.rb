require 'request_spec_helper'

describe 'articles endpoint' do
  describe 'GET #index' do
    describe 'without an accept header' do
      it 'responds with v2 as default and without .json suffix' do
        get '/api/articles'

        json = JSON.parse(response.body)
        articles = json.fetch('articles')

        expect(articles.count).to eq(50000)
        expect(articles.first['name']).to eq('Article 0')
      end

      it 'responds with v2 as default and with .json suffix' do
        get '/api/articles'

        json = JSON.parse(response.body)
        articles = json.fetch('articles')

        expect(articles.count).to eq(50000)
        expect(articles.first['name']).to eq('Article 0')
      end
    end

    describe 'v1' do
      it 'responds with an array of articles' do
        get '/api/articles', {}, HTTP_ACCEPT: 'application/vnd.articles.v1+json'

        json = JSON.parse(response.body)

        # these values are hard-coded in the controller as example
        expect(json.count).to eq(1)
        expect(json.first['name']).to eq('The Things')
      end

      it 'accepts requests with .json suffix' do
        get '/api/articles.json', {}, HTTP_ACCEPT: 'application/vnd.articles.v1+json'

        json = JSON.parse(response.body)

        expect(json.count).to eq(1)
        expect(json.first['name']).to eq('The Things')
      end
    end

    describe 'v2' do
      it 'responds with an array of articles under a root node' do
        get '/api/articles', {}, HTTP_ACCEPT: 'application/vnd.articles.v2+json'

        json = JSON.parse(response.body)
        articles = json.fetch('articles')

        # these values are hard-coded in the controller as example
        expect(articles.count).to eq(50000)
        expect(articles.first['name']).to eq('Article 0')
      end

      it 'accepts requests with .json suffix' do
        get '/api/articles.json', {}, HTTP_ACCEPT: 'application/vnd.articles.v2+json'

        json = JSON.parse(response.body)
        articles = json.fetch('articles')

        expect(articles.count).to eq(50000)
        expect(articles.first['name']).to eq('Article 0')
      end

      it 'accepts requests with a .mpac suffix' do
        get '/api/articles.mpac', {}, HTTP_ACCEPT: 'application/x-msgpack'

        mpac_hsh = MessagePack.unpack(response.body)
        articles = mpac_hsh.fetch('articles')

        expect(articles.count).to eq(50000)
        expect(articles.first['name']).to eq('Article 0')

        expect(response.headers["Content-Type"]).to eql("application/x-msgpack; charset=utf-8")
      end
    end
  end
end
