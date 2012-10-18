require 'hashie/trash'

module HasOffers
  module Parser
    class ParserShim < ::Hashie::Trash
      def self.string_property(*args)
        property(args)
      end

      def self.boolean_property

      end

      #...
    end

    module ClassMethods
      def define_parser(&block)
        parser_klass = Class.new(ParserShim, &block)

        define_singleton_method(:parse) do |json|
          new(parser_klass.new(json).to_hash)
        end
      end
    end

    def self.included(receiver)
      receiver.extend(ClassMethods)
    end
  end
end
