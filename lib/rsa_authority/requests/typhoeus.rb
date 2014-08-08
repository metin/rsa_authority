module RSAAuthority
  module Requests
    class Typhoeus < Base

      def sign(signature)
        request.options[:headers]['X-Signature'] = signature
      end

      def data
        request.options[:method].to_s.downcase + request.url
      end

      def signature
        request.options[:headers]['X-Signature']
      end

    end
  end
end
