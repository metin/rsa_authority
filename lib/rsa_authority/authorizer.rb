module RSAAuthority
  class Authorizer
    attr_accessor :request
    attr_accessor :public_key

    def initialize(request, public_key)
      @public_key = public_key
      @request = build_request(request)
    end

    def authentic?
       data == expected_data
    end

    def expected_data
      rsa_key = OpenSSL::PKey::RSA.new(File.read public_key)
      rsa_key.public_decrypt Base64.decode64(CGI.unescape(signature))
    end

    def data
      @request.data
    end

    def signature
      @request.signature
    end

    def build_request(request)
      Requests::ActionDispatch.new(request)
    end

  end
end
