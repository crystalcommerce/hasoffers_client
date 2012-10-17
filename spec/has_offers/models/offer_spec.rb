require 'spec_helper'
require 'has_offers/models/offer'

describe HasOffers::Models::Offer do
  describe ".parse" do
    let(:json) do
      # abbreviated
      {
        "Offer" => {
          "id"               => "2",
          "advertiser_id"    => nil,
          "name"             => "Arux Blog",
          "description"      => "Sweet Blog",
          "require_approval" => "0",
          "default_payout"   => "1.56",
          "modified"         => 1349908775
        }
      }
    end

    subject { HasOffers::Models::Offer.parse(json) }

    its(:id)            { should == '2' }
    its(:advertiser_id) { should be_nil }
    its(:description) { should == "Sweet Blog" }
    its(:require_approval)  { should be_false }
    its(:require_approval?) { should be_false }
    its(:default_payout) { should == BigDecimal.new("1.56") }
    its(:modified) { should == Time.new(2012, 10, 10, 15, 39, 35) }
  end
end
