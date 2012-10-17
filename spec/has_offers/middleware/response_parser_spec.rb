require 'spec_helper'
require 'has_offers/middleware/response_parser'

describe HasOffers::Middleware::ResponseParser do
  subject { HasOffers::Middleware::ResponseParser.new }

  describe "#call" do
    let(:env) { {:body => body} }
    let(:response) { subject.on_complete(env) }

    context "no results" do

    end

    context "fatal error with message" do
      let(:body) {
        {
          "response" => {
            "errors" => {
              "publicMessage" => "NetworkId FAKE_NETWORK_ID is not found"
            },
          "link" => "http://www.hasoffers.com/wiki/Category:API"
          }
        }
      }

      it "is not successful" do
        pending
        response.should_not be_successful
      end
    end
    
  end
end
