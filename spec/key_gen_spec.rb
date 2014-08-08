require 'spec_helper'

describe RSAAuthority::KeyGen do
  let(:test_key_name) { 'spec/support/gen_key' }
  let(:public_key) { "#{test_key_name}.pub" }
  let(:private_key) { "#{test_key_name}.pem" }

  after { File.delete public_key, private_key }

  it "generates public and privete key pair" do
    RSAAuthority::KeyGen.generate(test_key_name)

    expect(File.exists?(public_key)).to be(true)
    expect(File.exists?(private_key)).to be(true)
  end
end
