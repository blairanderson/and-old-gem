require 'rspec-expectations'

Given(/^we have a message in mind$/) do
  @message = {"article"=>{
    "title"=>"This is another title", 
    "revisions_attributes"=>{"0"=>{"body"=>"This is another body"}}
    }, "access_token"=>"lEQBBZo53cSKn0vWOTiIizjzyRQ2MG79"}
end

When(/^I post the message$/) do
  @tweeter = TweetGist.new
  @tweeter.commit_message(@message)
end

Then(/^the message should have been saved$/) do
  received = @tweeter.retrieve_message(@message)
  expect(received).to eq @message
end
