require 'relax'
require 'faraday'
require 'forwardable'
require 'faraday_middleware'
require 'has_offers/middleware'
require 'pry'

module HasOffers
  module Resource
    include ::Relax::Resource

    def connection(*)
      super do |builder|
        builder.request(:has_offers_authentication_injector, config)
        builder.request(:has_offers_target_injector, target)
        builder.request(config.format)


        #response middleware is in reverse order?

        builder.response(:has_offers_response_parser)
        builder.response(config.format)

        # middleware will default to stdout if not specified
        builder.response(:logger, config.logger) if config.logging?
      end
    end

    # implement this in the resource class
    def target
      nil
    end
  end
end
