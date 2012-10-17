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
  its(:format)        { should == :json }
  its(:service)       { should == "HasOffers" }
  its(:user_agent)    { should == "hasoffers_client #{HasOffers::VERSION}" }

  its(:params) { should == {
    'Service'      => 'HasOffers',
    'Version'      => '2',
    'NetworkId'    => 'NETID',
    'NetworkToken' => 'NETTOKEN',
    'Format'       => 'json'
  }}
end

describe HasOffers::Client do
  describe "#configure" do
    it "supports block-style configuration" do
      subject.configure do |config|
        config.network_id    = "NETID"
        config.network_token = "NETTOKEN"
      end

      subject.config.network_id.should    == "NETID"
      subject.config.network_token.should == "NETTOKEN"
    end
  end
end
