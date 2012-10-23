require 'spec_helper'
require 'has_offers'

describe "offers", :vcr => {:cassette_name => "offers"} do
  describe "getting all offers at once" do
    subject { hasoffers_client.offers }

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

    end

    context "offer does not exist" do

    end
  end
end
