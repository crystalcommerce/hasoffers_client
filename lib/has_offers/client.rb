require 'relax'
require 'has_offers/resources/offer'
require 'has_offers/resources/advertiser'

module HasOffers
  class Client
    class Config < ::Relax::Config
      attr_accessor :network_id
      attr_accessor :network_token
      attr_accessor :version
      attr_accessor :logging
      attr_accessor :logger
      attr_reader   :format
      attr_reader   :service

      def initialize(*)
        super
        self.base_uri  = "https://api.hasoffers.com"
        self.version ||= "2"
        self.logging = false if logging.nil?
        @service = "HasOffers"
        @format  = :json
      end

      def params
        {
          'Service'      => service,
          'Version'      => version,
          'NetworkId'    => network_id,
          'NetworkToken' => network_token,
          'Format'       => format.to_s
        }
      end

      alias_method :logging?, :logging

      def user_agent
        "hasoffers_client #{HasOffers::VERSION}"
      end
    end

    include ::Relax::Client

    def config
      @config ||= Config.new
    end

    def offers
      Resources::Offer.new(self)
    end

    def advertisers
      Resources::Advertiser.new(self)
    end
  end
end
