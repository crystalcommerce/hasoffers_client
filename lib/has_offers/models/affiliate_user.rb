require 'has_offers/parser'

module HasOffers
  module Models
    class AffiliateUser
      include HasOffers::Parser

      define_parser :root_element => "AffiliateUser" do
        string_property :id
        string_property :email
        string_property :first_name
        string_property :last_name
        string_property :phone
        string_property :cell_phone
        string_property :title
        datetime_property :join_date
        datetime_property :last_login
        string_property :permissions
        boolean_property :wants_alerts
        datetime_property :modified
        string_property :status
        string_property :user_id

        #TODO: access

        boolean_property :is_creator
        string_property :source_brand_id

        #TODO: probably more
      end
    end
  end
end
