require 'has_offers/resource'

module HasOffers
  module Resources
    class Advertiser
      SignupResult = Class.new(Struct.new(:advertiser_user, :advertiser))

      include ::HasOffers::Resource

      def target
        'Advertiser'
      end

      def signup(advertiser_signup)
        response = post('signup', advertiser_signup.to_hash).body

        if response.success?
          # root elements coexist in one object
          user = HasOffers::Models::AdvertiserUser.parse(response.body)
          advertiser = HasOffers::Models::Advertiser.parse(response.body)
          response.result = SignupResult.new(user, advertiser)
        end

        response
      end
    end
  end
end
