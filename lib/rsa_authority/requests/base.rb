module RSAAuthority
  module Requests
    class Base
      attr_accessor :request

      def initialize(request)
        @request = request
      end

    end
  end
end
