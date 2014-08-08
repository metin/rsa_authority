module RSAAuthority
  class Authorizer
    attr_accessor :request
    attr_accessor :public_key

    def initialize(request, public_key)
      @public_key = public_key
      @request = request
    end

    def authentic?
       data == expected_data
    end

    def expected_data
      rsa_key = OpenSSL::PKey::RSA.new(File.read public_key)
      rsa_key.public_decrypt Base64.decode64(CGI.unescape(signature))
    end

    def data
      request.request_method.downcase + request.env["REQUEST_URI"]
    end

    def signature
      request.headers['X-Signature']
    end
  end
end
