require 'spec_helper'
require 'has_offers'

describe "offers", :vcr => {:cassette_name => "offers",
                            :record => :new_episodes} do
  subject { hasoffers_client.offers }

  describe "getting all offers at once" do
    it "returns a successful response" do
      subject.all.should be_successful
    end

    it "returns a list of offers" do
      offers = subject.all.result
      offers.length.should == 1
      
      offer = offers.first
      offer.id.should == "2"
      offer.name.should == "Arux Blog"
      offer.percent_payout.should == BigDecimal.new("2.50")
    end
  end

  describe "finding single offer" do
    context "offer exists" do
      it "is successful" do
        subject.find(2).should be_successful
      end

      it "returns the parsed offer" do
        offer = subject.find(2).result
        offer.should be
        offer.name.should == "Arux Blog"
        offer.percent_payout.should == BigDecimal.new("2.50")
      end
    end

    context "offer does not exist" do
      it "is not successful" do
        subject.find(0).should_not be_successful
      end

      it "returns nil in the result" do
        subject.find(0).result.should be_nil
      end
    end
  end

  describe "creating an offer" do
    let(:offer) { HasOffers::Models::Offer.new }

    context "data is valid" do

      before(:each) do
        #TODO: defaults
        offer.name = "Test Offer"
        offer.description = "Just a Test"
        offer.percent_payout = BigDecimal.new("3.50")
        offer.offer_url = "http://example.com/offer"
        offer.preview_url = "http://example.com/preview"
        offer.advertiser_id = "2"
        offer.protocol = :http
        #TODO: enforce enum
        offer.status = :pending
        offer.expiration_date = Date.new(2015, 1, 1)
      end

      it "is successful" do
        subject.create(offer).should be_successful
      end

      it "returns the parsed offer" do
        created_offer = subject.create(offer).result
        created_offer.name.should == "Test Offer"
        created_offer.description.should == "Just a Test"
        created_offer.percent_payout.should == BigDecimal.new("3.50")
        created_offer.offer_url.should == "http://example.com/offer"
        created_offer.preview_url.should == "http://example.com/preview"
        created_offer.advertiser_id.should == "2"
        created_offer.protocol.should == "http"
        created_offer.status.should == "pending"
        created_offer.expiration_date.should == Date.new(2015, 1, 1)
      end
    end
  end
end
