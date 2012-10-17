module HasOffers
  module Models
    #TODO: dont do this
    class Offer < OpenStruct
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
