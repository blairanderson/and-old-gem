# ShareMore Ruby Library

## Installation

Add this line to your application's Gemfile:

    gem 'tweetgistify'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tweetgistify

## Usage

Create a new Instance with your api key.

    $ client = Tweetgistify::TG.new("YOUR_SHAREMORE_API_KEY_HERE")

Then create a post

    $ client.create(title: "article title", body: "This is for your article body, it can be as long as you want.")

The response includes the URL of the article and the article-id.


Next you can get all your articles


    $ client.index


Or you can request a single article


    $ client.article("article_id")

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
