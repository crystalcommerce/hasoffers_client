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
        builder.request(:url_encoded)
        builder.request(config.format)


        #response middleware is in reverse order?

        builder.response(:has_offers_response_parser)
        builder.response(config.format)

        # middleware will default to stdout if not specified
        builder.response(:logger, config.logger) if config.logging?
      end
    end

    [:get, :post].each do |http_verb|
      define_method(http_verb) do |has_offers_method, params, *args|
        pp params.merge('Method' => has_offers_method)
        super('/Api', params.merge('Method' => has_offers_method), *args)
      end
    end

    # implement this in the resource class
    def target
      nil
    end
  end
end
