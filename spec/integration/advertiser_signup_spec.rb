require 'spec_helper'
require 'has_offers'

describe "advertiser signup", :vcr => {:cassette_name => "advertiser_signup"} do
  let(:signup) { HasOffers::Models::AdvertiserSignup.new }

  subject { hasoffers_client.advertisers}

  describe "all required details provided" do
    before(:each) do
      signup.company    = "Example Store"
      signup.city       = "Seattle"
      signup.phone      = "111-111-1111"
      signup.region     = "WA"
      signup.address1   = "123 Fake St"
      signup.address2   = "Suite B"
      signup.country    = "US"
      signup.zipcode    = "98043"
      signup.email      = "joe@example.com"
      signup.first_name = "Joe"
      signup.last_name  = "Blow"
      signup.password   = "ysxwxfwsnyxwfqsxyw"
    end

    it "is successful" do
      subject.signup(signup).should be_successful
    end

    it "returns the advertiser" do
      advertiser = subject.signup(signup).result.advertiser

      advertiser.company.should   == "Example Store"
      advertiser.city.should      == "Seattle"
      advertiser.phone.should     == "111-111-1111"
      advertiser.region.should    == "WA"
      advertiser.address1.should  == "123 Fake St"
      advertiser.address2.should  == "Suite B"
      advertiser.country.should   == "US"
      advertiser.zipcode.should   == "98043"
    end

    it "returns the advertiser user" do
      advertiser_user = subject.signup(signup).result.advertiser_user

      advertiser_user.email.should      == "joe@example.com"
      advertiser_user.first_name.should == "Joe"
      advertiser_user.last_name.should  == "Blow"
    end
  end
end
