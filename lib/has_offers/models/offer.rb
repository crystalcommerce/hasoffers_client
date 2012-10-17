module HasOffers
  module Models
    #TODO: dont do this
    class Offer < OpenStruct
      def self.parse(json_with_root)
        new(json_with_root['Offer'])
      end
    end
  end
end
