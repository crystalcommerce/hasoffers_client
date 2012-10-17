require 'faraday'
require 'has_offers/response'

module HasOffers
  module Middleware
    class ResponseParser < ::Faraday::Response::Middleware
      def parse(parsed_json_body)
        response = parsed_json_body['response']
        errors = extract_errors(response)
        body = extract_body(response)

        HasOffers::Response.new(body, errors)
      end

    private
      def extract_errors(response)
        []
      end

      def extract_body(response)
        response['data']
      end
    end
  end
end

::Faraday.register_middleware :response,
  :has_offers_response_parser => HasOffers::Middleware::ResponseParser
