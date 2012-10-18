require 'has_offers/parser'

module HasOffers
  module Models
    #TODO: dont do this
    class Offer
      include HasOffers::Parser

      define_parser :root_element => "Offer" do
        string_property :id
        string_property :advertiser_id
        string_property :name
        string_property :description
        boolean_property :require_approval
        boolean_property :require_terms_and_conditions
        string_property :terms_and_conditions
        string_property :offer_url
        string_property :preview_url
        string_property :currency
        decimal_property :default_payout
        decimal_property :max_payout
        string_property :protocol
        string_property :status
        date_property :expiration_date
        boolean_property :is_private

        # not sure if integer or boolean :/
        integer_property :conversion_cap

        string_property :redirect_offer_id
        string_property :converted_offer_id
        decimal_property :percent_payout
        integer_property :session_hours
        integer_property :session_impression_hours
        string_property :converted_offer_url
        string_property :payout_type
        string_property :revenue_type
        boolean_property :tiered_payout
        boolean_property :tiered_revenue
        string_property :converted_offer_type

        string_property :status

        decimal_property :default_payout
        datetime_property :modified
      end

      alias_method :require_approval?, :require_approval
    end
  end
end
