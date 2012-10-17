require "has_offers/version"
require "has_offers/client"
require "relax"

module HasOffers
  extend ::Relax::Delegator[:client]

  def self.client
    @client ||= Client.new
  end
end
