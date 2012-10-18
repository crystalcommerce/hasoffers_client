require 'hashie/trash'
require 'bigdecimal'
require 'date'
require 'time'

module HasOffers
  module Parser
    # Pull in Trash updates from upstream
    module TrashPatch
      module ClassMethods
        def property(property_name, options = {})
          super

          if options[:from]
            if property_name.to_sym == options[:from].to_sym
              raise ArgumentError, "Property name (#{property_name}) and :from option must not be the same"
            end
            translations << options[:from].to_sym
            if options[:with].respond_to? :call
              class_eval do
                define_method "#{options[:from]}=" do |val|
                  self[property_name.to_sym] = options[:with].call(val)
                end
              end
            else
              class_eval <<-RUBY
                def #{options[:from]}=(val)
                  self[:#{property_name}] = val
                end
              RUBY
            end
          elsif options[:transform_with].respond_to? :call
            transforms[property_name.to_sym] = options[:transform_with]
          end
        end

        def translations
          @translations ||= []
        end

        def transforms
          @transforms ||= {}
        end
      end

      module InstanceMethods
        # Set a value on the Dash in a Hash-like way. Only works
        # on pre-existing properties.
        def []=(property, value)
          if self.class.translations.include? property.to_sym
            send("#{property}=", value)
          elsif self.class.transforms.key? property.to_sym
            super property, self.class.transforms[property.to_sym].call(value)
          elsif property_exists? property
            super
          end
        end
      end
    end

    class ParserShim < ::Hashie::Trash
      extend TrashPatch::ClassMethods
      include TrashPatch::InstanceMethods

      class << self
        def string_property(name, options = {})
          property(name,
                   options.merge(:transform_with => ->(x){x && x.to_s}))
        end

        def integer_property(name, options = {})
          property(name,
                   options.merge(:transform_with => ->(x){x && x.to_i}))
        end

        def boolean_property(name, options = {})
          boolean_properties << name
          property(name,
                   options.merge(:transform_with => ->(x) {to_bool(x)}))
        end

        def decimal_property(name, options = {})
          property(name,
                   options.merge(:transform_with => ->(x){x && to_decimal(x)}))
        end

        def datetime_property(name, options = {})
          property(name,
                   options.merge(:transform_with => ->(x){x && to_datetime(x)}))
        end

        def date_property(name, options = {})
          property(name,
                   options.merge(:transform_with => ->(x){x && to_date(x)}))
        end

        def boolean_properties
          @boolean_properties ||= Set.new
        end

      private

        def to_bool(val)
          case val
          when String
            val == '1'
          when Fixnum
            val == 1
          else
            val
          end
        end

        def to_decimal(val)
          BigDecimal.new(val)
        end

        #TODO: see if there are other formats besides int :(
        def to_datetime(val)
          Time.at(val)
        end

        def to_date(val)
          Date.parse(val)
        end
      end
    private

      # Just skip if a miss, don't raise
      def property_exists?(property)
        self.class.properties.include?(property.to_sym)
      end
    end

    module ClassMethods
      def define_parser(options = {}, &block)
        parser_klass = Class.new(ParserShim, &block)

        parser_klass.properties.each do |property|
          attr_accessor property
        end

        parser_klass.boolean_properties.each do |property|
          alias_method "#{property}?", property
        end

        define_singleton_method(:parse) do |json|
          if root_element = options[:root_element]
            json = json.fetch(options[:root_element])
          end

          new(parser_klass.new(json).to_hash)
        end
      end
    end

    def initialize(attrs = {})
      attrs.each do |k, v|
        send("#{k}=", v)
      end
    end

    def self.included(receiver)
      receiver.extend(ClassMethods)
    end
  end
end
