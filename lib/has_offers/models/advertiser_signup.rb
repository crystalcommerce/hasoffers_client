module HasOffers
  module Models
    class AdvertiserSignup
      attr_accessor :company,
                    :city,
                    :phone,
                    :region,
                    :address1,
                    :address2,
                    :country,
                    :zipcode,
                    :email,
                    :first_name,
                    :last_name,
                    :password

      #TODO: validate password between 4 and 16 characters

      def to_hash
        {
          'account' => {
            "company"    => company,
            "city"       => city,
            "phone"      => phone,
            "region"     => region,
            "address1"   => address1,
            "address2"   => address2,
            "country"    => country,
            "zipcode"    => zipcode,
          },
          'user' => {
            "email"                 => email,
            "first_name"            => first_name,
            "last_name"             => last_name,
            "password"              => password,
            "password_confirmation" => password
          }
        }
      end
    end
  end
end
