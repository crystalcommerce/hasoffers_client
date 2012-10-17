require 'spec_helper'
require 'has_offers/resources/offer'

describe HasOffers::Resources::Offer,
         :vcr => {:cassette_name => "offers"} do
  subject { hasoffers_client.offers }

  describe "#all" do
    it "returns a successful response" do
      subject.all.should be_successful
    end
  end
end
