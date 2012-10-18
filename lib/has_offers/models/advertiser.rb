require 'has_offers/parser'

module HasOffers
  module Models
    class Advertiser
      include HasOffers::Parser

      define_parser :root_element => "Advertiser" do
        string_property :id
        string_property :source_brand_id
        string_property :company
        string_property :address1
        string_property :address2
        string_property :city
        string_property :region
        string_property :country
        #TODO: other?
        string_property :zipcode
        string_property :phone
        string_property :fax
        string_property :website
        datetime_property :date_added
        datetime_property :modified
        string_property :signup_ip
        string_property :status
        boolean_property :wants_alerts
        string_property :account_manager_id
        string_property :network_map_id
        string_property :account_id
      end
    end
  end
end
