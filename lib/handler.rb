module Handler
  # MATCHERS = []
  def handle(result, *)
    if result.success?
      return yield(result) if block_given? # For grape mostly
      return result # For graphql mostly
    end
    return failure(result) if result.failure?
    error('Something went wrong! Please, try again or contact the developer!', 500)
  end

  def failure(result)
    return error('This action is forbidden', 403) if result['result.policy.default']&.failure?
    error(result[:errors][:message], result[:errors][:status]) if result[:errors]
  end

  def error(msg, status = nil)
    raise RequestError.new(msg, status)
  end

  class RequestError < StandardError

    attr_reader :status

    def initialize(message, status = nil)
      @status = status || 400
      super(message)
    end
  end
end
