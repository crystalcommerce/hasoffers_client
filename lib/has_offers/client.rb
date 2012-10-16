require 'relax'

module HasOffers
  class Client
    class Config < ::Relax::Config
      attr :network_id,    true
      attr :network_token, true

      def initialize(*)
        super
        self.base_uri = "https://api.hasoffers.com/Api"
      end
    end
  end
end
