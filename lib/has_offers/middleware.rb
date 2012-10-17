module HasOffers
  module Middleware
  end
end

Dir[File.join(File.dirname(__FILE__), 'middleware', '*.rb')].each {|f| require(f)}
