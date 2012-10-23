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
end
