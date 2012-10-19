require 'has_offers/parser'

module HasOffers
  module Models
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
        boolean_property :allow_multiple_conversions
        boolean_property :allow_multiple_conversions
        boolean_property :allow_website_links
        boolean_property :show_custom_variables
        boolean_property :approve_conversions
        decimal_property :max_percent_payout
        boolean_property :set_session_on_impression
        boolean_property :display_advertiser
        boolean_property :enforce_geo_targeting
        boolean_property :show_mail_list
        string_property :dne_list_id
        string_property :dne_unsubscribe_url
        string_property :dne_download_url
        boolean_property :email_instructions
        string_property :email_instructions_from
        string_property :email_instructions_subject

        #do not know the type of conversion_ratio_threshold
        boolean_property :featured
        boolean_property :is_subscription

        #do not know the type of subscription_duration
        #do not know the type of customer_list_id

        boolean_property :is_seo_friendly_301

        #do not know the type of subscription_frequency
        #do not know the type of rating

        string_property :ref_id
        datetime_property :modified
        boolean_property :is_expired
        boolean_property :disable_click_macro
        string_property :click_macro_url
        string_property :hostname_id
        boolean_property :has_goals_enabled
        boolean_property :enforce_encrypt_tracking_pixels
        string_property :default_goal_name
        boolean_property :enable_offer_whitelist
        string_property :note
        #do not know the type of monthly_conversion_cap
        decimal_property :payout_cap
        decimal_property :monthly_payout_cap
        decimal_property :revenue_cap
        decimal_property :monthly_revenue_cap
      end
    end
  end
end
