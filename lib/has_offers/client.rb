require 'relax'

module HasOffers
  class Client
    class Config < ::Relax::Config
      attr_accessor :network_id
      attr_accessor :network_token
      attr_accessor :version
      attr_accessor :format
      attr_accessor :logging
      attr_accessor :logger
      attr_reader   :service

      def initialize(*)
        super
        self.base_uri  = "https://api.hasoffers.com/Api"
        self.version ||= "2"
        self.format  ||= :json
        self.logging = false if logging.nil?
        @service = "HasOffers"
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
  end
end
