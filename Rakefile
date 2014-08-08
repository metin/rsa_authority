require "bundler/gem_tasks"
require "rsa_authority"

namespace :rsa_authority do

  desc "Generate public private RSA key pair"
  task :key_gen, :name do |t, args|
    RSAAuthority::KeyGen.generate(args[:name])
  end

end
