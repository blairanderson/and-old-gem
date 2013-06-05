require 'spec_helper'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :webmock # or :fakeweb
end

describe Tweetgistify::SM do 
  let(:valid_title){"Article Title"}
  let(:valid_body){"Article Body"}

  context '#article' do 
    it 'should get an article' do
      client = Tweetgistify::SM.new("JDVr-w8bxoU")#This is a test api key
      VCR.use_cassette("fetch_article") do 
        article = client.article("bj5KdHc")
        expect(article["title"]).to eq "Article Title"
        expect(article["body"]).to eq "This is a fancy text editor"
      end
    end
  end

  context '#articles' do 
    it 'should return all the articles for an authenticated user' do 
      client = Tweetgistify::SM.new("JDVr-w8bxoU") #This is a test api key
      VCR.use_cassette("fetch_all_articles") do 
        articles = client.articles
        expect(articles[0]["title"]).to_not be_nil
        expect(articles[0]["body"]).to_not be_nil
      end
    end
  end

  context '#create' do 
    it 'should create an article and return the URL and ID' do 
      valid_article = {title: "Valid Title", body: "Valid Body"}
      client = Tweetgistify::SM.new("JDVr-w8bxoU")#This is a test api key
      VCR.use_cassette("create_and_fetch_article") do 
        article_response = client.create(valid_article)
        article = client.article(article_response["article_id"])
        expect(article["title"]).to eq "Valid Title"
        expect(article["body"]).to eq "Valid Body"
      end
    end
  end
end
