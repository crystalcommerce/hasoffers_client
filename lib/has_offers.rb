require "relax"

module HasOffers
  extend ::Relax::Delegator[:client]

  def self.client
    @client ||= Client.new
  end
end

require "has_offers/version"
require "has_offers/client"
Dir[File.join(File.dirname(__FILE__), "**", '*.rb')].each {|f| require f}
