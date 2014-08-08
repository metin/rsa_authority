module RSAAuthority
  class KeyGen
    def self.generate(key_name)
      rsa_private_key = OpenSSL::PKey::RSA.generate(2048)

      File.open("#{key_name}.pem", "w") { |io|  io.write(rsa_private_key.to_s)  }

      File.open("#{key_name}.pub", "w") { |io|  io.write(rsa_private_key.public_key)  }
    end
  end
end
