module HasOffers
  module Models
    class AdvertiserSignup
      attr_accessor :company
      attr_accessor :city
      attr_accessor :phone
      attr_accessor :region
      attr_accessor :address1
      attr_accessor :address2
      attr_accessor :country
      attr_accessor :zipcode
      attr_accessor :email
      attr_accessor :first_name
      attr_accessor :last_name
      attr_accessor :password

      def to_hash
        {
          "company"    => company,
          "city"       => city,
          "phone"      => phone,
          "region"     => region,
          "address1"   => address1,
          "address2"   => address2,
          "country"    => country,
          "zipcode"    => zipcode,
          "email"      => email,
          "first_name" => first_name,
          "last_name"  => last_name,
          "password"   => password
        }
      end
    end
  end
end
