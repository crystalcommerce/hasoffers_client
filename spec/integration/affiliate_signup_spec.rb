require 'spec_helper'
require 'has_offers'

describe "affiliate signup", :vcr => {:cassette_name => "affilaite_signup"} do
  let(:signup) { HasOffers::Models::AffiliateSignup.new }

  subject { hasoffers_client.affiliates}

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
      signup.password   = "xxxxxxxxxx"
    end

    it "is successful" do
      subject.signup(signup).should be_successful
    end

    it "returns the affiliate" do
      affiliate = subject.signup(signup).result.affiliate

      affiliate.company.should   == "Example Store"
      affiliate.city.should      == "Seattle"
      affiliate.phone.should     == "111-111-1111"
      affiliate.region.should    == "WA"
      affiliate.address1.should  == "123 Fake St"
      affiliate.address2.should  == "Suite B"
      affiliate.country.should   == "US"
      affiliate.zipcode.should   == "98043"
    end

    it "returns the affiliate user" do
      affiliate_user = subject.signup(signup).result.affiliate_user

      affiliate_user.email.should      == "joe@example.com"
      affiliate_user.first_name.should == "Joe"
      affiliate_user.last_name.should  == "Blow"
    end
  end
end
