module HasOffers
  module Middleware
    class ParameterInjector < ::Faraday::Middleware
      extend Forwardable
      def_delegators :'Faraday::Utils', :parse_query, :build_query

      def call(env)
        case env[:method]
        when :post, :put then merge_post_params(env)
        else                  merge_url_params(env)
        end

        @app.call(env)
      end

    private

      def merge_post_params(env)
        env[:body] ||= {}
        env[:body].merge!(param_overrides)
      end

      def merge_url_params(env)
        new_params = query_params(env[:url]).merge(param_overrides)

        env[:url].query = build_query(new_params)
      end

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
