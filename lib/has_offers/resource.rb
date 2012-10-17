require 'relax'
require 'faraday'
require 'forwardable'
require 'faraday_middleware'

module HasOffers
  module Resource
    include ::Relax::Resource

    class AuthenticationInjector < ::Faraday::Middleware
      extend Forwardable
      def_delegators :'Faraday::Utils', :parse_query, :build_query

      #TODO: determine if necessary
      attr_reader :config

      def initialize(app, config)
        super(app)
      end

      def call(env)
        new_params = config.params.update(query_params(env[:url]))

        env[:url].query = build_query(new_params)

        @app.call(env)
      end
    end

    ::Faraday.register_middleware :request,
      :has_offers_authentication_injector => AuthenticationInjector

    def connection(*)
      super do |builder|
        builder.request(:has_offers_authentication_injector, config)
      end
    end
  end
end
