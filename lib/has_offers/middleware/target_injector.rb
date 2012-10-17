module HasOffers
  module Middleware
    class TargetInjector < ParameterInjector
      attr_reader :target

      def initialize(app, target)
        super(app)
        @target = target
      end

    private
      def param_overrides
        {
          'Target' => target
        }
      end

    end
  end
end

::Faraday.register_middleware :request,
  :has_offers_target_injector => HasOffers::Middleware::TargetInjector
