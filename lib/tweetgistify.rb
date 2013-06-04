require "tweetgistify/version"
require 'rubygems'
require 'json'
require 'ostruct'
require 'faraday'


module Tweetgistify
  class TG
    attr_reader :conn, :key

    def initialize(key)
      @key = key
      @conn = ::Faraday.new(:url => 'http://localhost:3000') do |faraday|
        faraday.request  :url_encoded
        faraday.response :logger
        faraday.adapter  Faraday.default_adapter
      end
    end

    def create(args)#accepts :title and :body
      message = {"article"=>{
      "title"=> args[:title], 
      "revisions_attributes"=>{"0"=>{"body"=> args[:body]}}
      }, "access_token"=> @key }
      response = conn.post do |req|
        req.url '/articles.json'
        req.headers['Content-Type'] = 'application/json'
        req.body = message.to_json
      end
      puts response.inspect
      puts response.env[:response_headers][:location]
    end


    def index(args={})
      response = conn.get do |req| # GET http://sushi.com/search?page=2&limit=100
        req.url '/articles.json', args
        req.headers['Content-Type'] = 'application/json'
        req.params['limit'] = 100
      end
    end

    def article(article_id)
      
    end

  end
end
