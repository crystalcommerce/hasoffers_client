require 'has_offers/resource'

module HasOffers
  module Resources
    class Affiliate
      SignupResult = Struct.new(:affiliate_user, :affiliate)

      include ::HasOffers::Resource

      def target
        'Affiliate'
      end

      def signup(affiliate_signup)
        response = post('signup', affiliate_signup.to_hash).body

        if response.success?
          # root elements coexist in one object
          user = HasOffers::Models::AffiliateUser.parse(response.body)
          affiliate = HasOffers::Models::Affiliate.parse(response.body)
          response.result = SignupResult.new(user, affiliate)
        end

        response
      end
    end
  end
end
