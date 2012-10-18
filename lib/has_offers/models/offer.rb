module HasOffers
  module Models
    #TODO: dont do this
    class Offer < OpenStruct
      include HasOffers::Parser

      define_parser do
        string_property :id
        string_property :advertiser_id
        string_property :name
        string_property :description
        boolean_property :require_approval
        decimal_property :default_payout
        datetime_property :modified
      end

      def self.parse(json_with_root)
        new(json_with_root['Offer'].inject({}) do |acc, (attr, value)|
          acc[attr] = case attr
                      when 'require_approval'
                        value != "0"
                      when 'default_payout'
                        BigDecimal.new(value)
                      when 'modified'
                        Time.at(value)
                      else
                        value
                      end
          acc
        end)
      end
    end
  end
end
