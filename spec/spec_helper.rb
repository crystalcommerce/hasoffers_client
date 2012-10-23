require 'vcr'
require 'pry'
Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each {|f| require f}

VCR.configure do |c|
  c.cassette_library_dir = File.join(File.dirname(__FILE__),
                                     'fixtures/vcr_cassettes')
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.filter_sensitive_data("<HAS_OFFERS_NETWORK_ID>") do 
    ENV.fetch('HAS_OFFERS_NETWORK_ID')
  end

  c.filter_sensitive_data("<HAS_OFFERS_NETWORK_TOKEN>") do
    ENV.fetch('HAS_OFFERS_NETWORK_TOKEN')
  end
end

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'

  config.include(HasOffersClientHelper)

  # Will not be required in RSpec 3
  config.treat_symbols_as_metadata_keys_with_true_values = true
end
