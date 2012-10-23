require 'has_offers/parser'

module HasOffers
  module Models
    class Affiliate
      include HasOffers::Parser

      define_parser :root_element => "Affiliate" do
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
        integer_property :fraud_activity_score
        integer_property :fraud_profile_score

        # don't know about fraud_activity_alert_threshold
        # don't know about fraud_activity_block_threshold
        # don't know about fraud_profile_alert_threshold
        # don't know about fraud_profile_block_threshold
      end
    end
  end
end
