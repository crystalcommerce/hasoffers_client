require 'has_offers/resource'
require 'has_offers/models/offer'

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
        response = get('', {'page' => 1, 'limit' => 50, 'Method' => 'findAll'}).body
        if response.success?
          response.result = response.body['data'].map do |id, offer|
            HasOffers::Models::Offer.parse(offer)
          end
        end

        response
      end
    end
  end
end
