require 'spec_helper'

describe RSAAuthority::Signer do
  let(:test_key_name) { 'example_key' }
  let(:public_key) { "#{test_key_name}.pub" }
  let(:private_key) { "#{test_key_name}.pem" }
  let(:request) { double 'request', options: { headers:{}, method: 'GET' }, url: 'http://example.dev/?a=1&b=2' }

  # generate keys
  before { RSAAuthority::KeyGen.generate(test_key_name) }
  after { File.delete public_key, private_key }

  let(:signer) { RSAAuthority::Signer.new(request, private_key) }

  it { expect(signer.data).to eq("gethttp://example.dev/?a=1&b=2") }

  context "when signed" do
    before { signer.sign }
    it { request.options[:headers]['X-Signature'].size > 10  }
  end
end
