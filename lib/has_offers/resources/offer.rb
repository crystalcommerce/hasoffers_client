require 'has_offers/resource'

module HasOffers
  module Resources
    class Offer
      include ::HasOffers::Resource

      def target
        'Offer'
      end

      #TODO: offer a chunked version and a multi-page version
      #TODO: accept limit in the options
      def all
        get('findAll', {'page' => 1, 'limit' => 50}).body
      end
    end
  end
end
