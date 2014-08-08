require 'spec_helper'

describe RSAAuthority::Authorizer do
  let(:test_key_name) { 'spec/support/example_key' }
  let(:public_key) { "#{test_key_name}.pub" }

  let(:request) { double 'request', env:{'REQUEST_URI'=> 'http://example.dev/?a=1&b=2'},
                                    request_method: 'GET',
                                    headers: {'X-Signature' => 'Qwnp3gqCSxiNL6yGS6KNUnS8WyxQy9cj2UpdWPEKSZ60CJ8fBe9byPq1C7bz%0AqUwfjgu4XLBPFv8i7sYAzKDVYYhnWZopvRtnpzscNJcr8ZyxjacyYicv%2Bi1w%0AkH0tlA5NPJs0Mk1b5mYId0gx%2FQ4WKOpgm%2FzL2W0t0DriiJJMBUtLJs5dstsr%0ABz5xR6UQKKFmQ0dkSWf5r%2F5B5lqcjypEIttHrinLBecdWK5F%2F0N6RI9J5KRm%0ALL9YKNFjra4zCOo8VAp1nSQHL5Wj5D07OLqC6WOGtpL%2F4NazIcP6w7Y55ImU%0Af8%2BPQzIFZhUfmYZQGlHqdi2NAIkczZz%2FOJdiakP3FA%3D%3D%0A'}  }

  let(:authorizer) { RSAAuthority::Authorizer.new(request, public_key) }

  it { expect(authorizer.data).to eq("gethttp://example.dev/?a=1&b=2") }
  it { expect(authorizer).to be_authentic }
end
