require 'spec_helper'

describe RSAAuthority::Signer do
  let(:test_key_name) { 'spec/support/example_key' }
  let(:private_key) { "#{test_key_name}.pem" }
  let(:request) { double 'request', options: { headers:{}, method: 'GET' }, url: 'http://example.dev/?a=1&b=2' }

  let(:signer) { RSAAuthority::Signer.new(request, private_key) }

  it { expect(signer.data).to eq("gethttp://example.dev/?a=1&b=2") }
  it { expect(signer.signature).to eq('Qwnp3gqCSxiNL6yGS6KNUnS8WyxQy9cj2UpdWPEKSZ60CJ8fBe9byPq1C7bz%0AqUwfjgu4XLBPFv8i7sYAzKDVYYhnWZopvRtnpzscNJcr8ZyxjacyYicv%2Bi1w%0AkH0tlA5NPJs0Mk1b5mYId0gx%2FQ4WKOpgm%2FzL2W0t0DriiJJMBUtLJs5dstsr%0ABz5xR6UQKKFmQ0dkSWf5r%2F5B5lqcjypEIttHrinLBecdWK5F%2F0N6RI9J5KRm%0ALL9YKNFjra4zCOo8VAp1nSQHL5Wj5D07OLqC6WOGtpL%2F4NazIcP6w7Y55ImU%0Af8%2BPQzIFZhUfmYZQGlHqdi2NAIkczZz%2FOJdiakP3FA%3D%3D%0A')  }

  context "when signed" do
    before { signer.sign }
    it { request.options[:headers]['X-Signature'].size > 10  }
  end
end
