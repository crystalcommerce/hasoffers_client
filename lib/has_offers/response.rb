module HasOffers
  class Response
    attr_reader :result

    def initialize(result, errors = [])
      @result = result
      @errors = errors
    end

    def success?
      errors.empty?
    end

    def errors
      @errors.dup
    end
  end
end
