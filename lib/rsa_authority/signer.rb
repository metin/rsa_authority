module RSAAuthority
  class Signer
    attr_accessor :request
    attr_accessor :private_key

    def initialize(request, private_key)
      @private_key = private_key
      @request = request
    end

    def sign
      request.options[:headers]['X-Signature'] = signature
    end

    def signature
      rsa_key = OpenSSL::PKey::RSA.new(File.read private_key)
      CGI.escape Base64.encode64(rsa_key.private_encrypt data)
    end

    def data
      request.options[:method].to_s.downcase + request.url
    end
  end
end
