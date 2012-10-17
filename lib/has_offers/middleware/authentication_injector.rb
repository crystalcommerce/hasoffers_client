module HasOffers
  module Middleware
    class AuthenticationInjector < ParameterInjector
      attr_reader :config

      def initialize(app, config)
        super(app)
        @config = config
      end

    private

      def param_overrides
        config.params
      end
    end
  end
end

::Faraday.register_middleware :request,
  :has_offers_authentication_injector => HasOffers::Middleware::AuthenticationInjector
