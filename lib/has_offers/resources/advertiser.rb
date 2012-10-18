require 'has_offers/resource'

module HasOffers
  module Resources
    class Advertiser
      include ::HasOffers::Resource

      def target
        'Advertiser'
      end

      def signup
        #TODO
      end
    end
  end
end
