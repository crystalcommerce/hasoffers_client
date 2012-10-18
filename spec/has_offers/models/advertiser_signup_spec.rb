require 'spec_helper'
require 'has_offers/models/advertiser_signup'

describe HasOffers::Models::AdvertiserSignup do
  let(:signup) { HasOffers::Models::AdvertiserSignup.new }
  subject { signup }

  before(:each) do
    signup.company    = "COMPANY"
    signup.city       = "CITY"
    signup.phone      = "PHONE"
    signup.region     = "REGION"
    signup.address1   = "ADDRESS1"
    signup.address2   = "ADDRESS2"
    signup.country    = "COUNTRY"
    signup.zipcode    = "ZIPCODE"
    signup.email      = "EMAIL"
    signup.first_name = "FIRST_NAME"
    signup.last_name  = "LAST_NAME"
    signup.password   = "PASSWORD"
  end

  its(:to_hash) { should == {
    "company"    => "COMPANY",
    "city"       => "CITY",
    "phone"      => "PHONE",
    "region"     => "REGION",
    "address1"   => "ADDRESS1",
    "address2"   => "ADDRESS2",
    "country"    => "COUNTRY",
    "zipcode"    => "ZIPCODE",
    "email"      => "EMAIL",
    "first_name" => "FIRST_NAME",
    "last_name"  => "LAST_NAME",
    "password"   => "PASSWORD"
  }}
end
