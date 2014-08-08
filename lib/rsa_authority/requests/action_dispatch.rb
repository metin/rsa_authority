module RSAAuthority
  module Requests
    class ActionDispatch < Base

      def sign(signature)
        request.headers['X-Signature'] = signature
      end

      def data
        request.request_method.downcase + request.env["REQUEST_URI"]
      end

      def signature
        request.headers['X-Signature']
      end

    end
  end
end
