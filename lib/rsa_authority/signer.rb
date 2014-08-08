module RSAAuthority
  class Signer
    attr_accessor :request
    attr_accessor :private_key

    def initialize(request, private_key)
      @private_key = private_key
      @request = build_request(request)
    end

    def sign
      @request.sign signature
    end

    def signature
      rsa_key = OpenSSL::PKey::RSA.new(File.read private_key)
      CGI.escape Base64.encode64(rsa_key.private_encrypt data)
    end

    def data
      @request.data
    end

    def build_request(request)
      Requests::Typhoeus.new(request)
    end
  end
end
