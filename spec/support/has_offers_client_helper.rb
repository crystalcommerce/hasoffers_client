require 'logger'

module HasOffersClientHelper
  def hasoffers_client
    client = HasOffers::Client.new
    client.configure do |config|
      config.network_id    = ENV.fetch('HAS_OFFERS_NETWORK_ID',
                                       'FAKE_NETWORK_ID')
      config.network_token = ENV.fetch('HAS_OFFERS_NETWORK_TOKEN',
                                       'FAKE_NETWORK_TOKEN')
      config.logging = true
      logger = ::Logger.new(STDOUT)
      logger.level = ::Logger::DEBUG
      config.logger = logger
    end
    client
  end
end
