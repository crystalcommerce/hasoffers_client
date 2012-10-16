require 'spec_helper'
require 'has_offers/client'

describe HasOffers::Client::Config do
  let(:config) { HasOffers::Client::Config.new }
  subject { config }

  before(:each) do
    config.network_id    = "NETID"
    config.network_token = "NETTOKEN"
  end

  its(:network_id)    { should == "NETID" }
  its(:network_token) { should == "NETTOKEN" }
  its(:base_uri)      { should == "https://api.hasoffers.com/Api" }
  its(:version)       { should == "2" }
  its(:format)        { should == "json" }
  its(:service)       { should == "HasOffers" }
end
