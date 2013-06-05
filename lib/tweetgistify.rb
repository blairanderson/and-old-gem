require "tweetgistify/version"
require 'json'
require 'faraday'


module Tweetgistify
  class SM
    attr_reader :conn, :key

    def initialize(key)
      @key = key
      @conn = connection
    end

    def article(article_id)
      request(:get, get_article_uri(article_id) ) 
    end

    def articles
      request(:get, articles_uri, access_token: key)
    end

    def create(article)
      response = conn.post do |req|
        req.url articles_uri, access_token: key
        req.headers['Content-Type'] = 'application/json'
        req.body = article.to_json
      end
      parse_response(response)
    end

    def request(verb, url, args = {})
      response = conn.send(verb) do |req| 
        req.url url, args
        req.headers['Content-Type'] = 'application/json'
      end
      parse_response(response)
    end

  private

    def articles_uri
      "articles"
    end

    def get_article_uri(article_id)
      "articles/#{article_id}"
    end

    def connection
      conn = ::Faraday.new(:url => root_url) do |faraday|
        faraday.request  :url_encoded
        faraday.response :logger
        faraday.adapter  Faraday.default_adapter
      end
      conn
    end

    def parse_response(response)
      if response.status == 200
        JSON.parse(response.body)
      elsif response.status == 404
        nil
      else
        raise response.body
      end
    end

    def root_url
      "http://share-more.herokuapp.com/api/v1/"
    end
  end
end
