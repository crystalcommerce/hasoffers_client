require 'has_offers/resource'

module HasOffers
  module Resources
    class Affiliate
      include ::HasOffers::Resource

      def target
        'Affiliate'
      end

      def signup
        #TODO
      end
    end
  end
end
