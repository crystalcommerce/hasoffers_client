module HasOffers
  class Response
    attr_reader   :body
    attr_accessor :result

    def initialize(body, errors = [])
      @body   = body
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
