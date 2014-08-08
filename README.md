# RSAAuthority

Signing and authorization of HTTP requests with RSA keys

## Installation

Add this line to your application's Gemfile:

    gem 'rsa_authority'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rsa_authority

## Usage
Generate your RSA key pairs. You can use utility provided in the gem
```
rake rsa_authority:key_gen["example"]
```
This will generate both public and private keys
`expamle.pem`
`example.pub`

Then send your public key to the server you want to be allowed to send the requests.


### Client side

Sign the request before executing it with client side private key
```ruby
signer = RSAAuthority::Signer.new(request, private_key)
signer.sign
```
This will add a header to the HTTP request. This is signed version of the request.


### Server side
Find private key for the cient. Client should have a client id, and server should have that client id associated with public key for the client

```ruby
auth = RSAAuthority::Authorizer.new(request, public_key)
auth.authentic?
```



## Contributing

1. Fork it ( https://github.com/metin/rsa_authority/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
