RSpec::Matchers.define :be_successful do
  match do |response|
    response.success?
  end

  failure_message_for_should do |response|
    "expected that the response would be successful but got #{response.errors.map(&:message)}"
  end

  failure_message_for_should_not do |_|
    "expected response to not be successful but it was"
  end
end
