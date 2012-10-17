module HasOffers
  module Middleware
    class ParameterInjector < ::Faraday::Middleware
      extend Forwardable
      def_delegators :'Faraday::Utils', :parse_query, :build_query

      def call(env)
        new_params = param_overrides.update(query_params(env[:url]))

        env[:url].query = build_query(new_params)

        @app.call(env)
      end

    private

      def param_overrides
        raise NotImplementedError
      end

      def query_params(url)
        if url.query.nil? or url.query.empty?
          {}
        else
          parse_query url.query
        end
      end
    end
  end
end
