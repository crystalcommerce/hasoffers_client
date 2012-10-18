require 'has_offers/resource'

module HasOffers
  module Resources
    class Advertiser
      SignupResult = Class.new(Struct.new(:user, :advertiser))

      include ::HasOffers::Resource

      def target
        'Advertiser'
      end

      def signup(advertiser_signup)
        response = post('signup', advertiser_signup.to_hash).body

        if response.success?
          data = response.body['data']
          # root elements coexist in one object
          user = HasOffers::Models::AdvertiserUser.parse(data)
          advertiser = HasOffers::Models::AdvertiserUser.parse(data)
          response.result = SignupResult.new(user, advertiser)
        end

        response
      end
    end
  end
end
