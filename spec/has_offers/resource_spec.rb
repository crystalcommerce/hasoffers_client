require 'spec_helper'

require 'has_offers/resource'

describe HasOffers::Resource do
  class TestResource
    include HasOffers::Resource
  end
end
