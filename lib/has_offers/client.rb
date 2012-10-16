require 'relax'

module HasOffers
  class Client
    class Config < ::Relax::Config
      attr_accessor :network_id
      attr_accessor :network_token
      attr_accessor :version
      attr_accessor :format
      attr_reader   :service

      def initialize(*)
        super
        self.base_uri  = "https://api.hasoffers.com/Api"
        self.version ||= "2"
        self.format  ||= "json"
        @service = "HasOffers"
      end
    end

    include ::Relax::Client

    def config
      @config ||= Config.new
    end
  end
end
