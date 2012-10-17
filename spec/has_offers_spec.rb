require 'spec_helper'
require 'has_offers'

describe HasOffers do
  subject { HasOffers }
  describe "delegation" do
    it "delegates configuration to the client" do
      subject.configure do |config|
        config.network_id = "NETID"
      end

      subject.config.network_id.should == "NETID"
    end
  end
end
