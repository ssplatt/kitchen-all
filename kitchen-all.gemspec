# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kitchen/all'

Gem::Specification.new do |spec|
  spec.name          = 'kitchen-all'
  spec.version       = Kitchen::All::VERSION
  spec.authors       = ['Seth Vargo']
  spec.email         = ['sethvargo@gmail.com']
  spec.description   = %q{A Test Kitchen driver that includes all the drivers known to man/computer}
  spec.summary       = %q{Test Kitchen bundles drivers individually, but sometimes you just want to play pokemon and catch 'em all}
  spec.homepage      = 'https://github.com/sethvargo/kitchen-all'
  spec.license       = 'Apache 2.0'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'gems', '~> 0.8'
  spec.add_development_dependency 'rake'

  spec.add_runtime_dependency 'kitchen-bluebox', '>= 0.0.0' # TK
  spec.add_runtime_dependency 'kitchen-cloudstack', '>= 0.0.0' # TK
  spec.add_runtime_dependency 'kitchen-digitalocean', '>= 0.0.0' # TK
  spec.add_runtime_dependency 'kitchen-docker', '>= 0.0.0' # TK
  spec.add_runtime_dependency 'kitchen-ec2', '>= 0.0.0' # TK
  spec.add_runtime_dependency 'kitchen-fifo', '>= 0.0.0' # TK
  spec.add_runtime_dependency 'kitchen-libvirtlxc', '>= 0.0.0' # TK
  spec.add_runtime_dependency 'kitchen-lxc', '>= 0.0.0' # TK
  spec.add_runtime_dependency 'kitchen-openstack', '>= 0.0.0' # TK
  spec.add_runtime_dependency 'kitchen-rackspace', '>= 0.0.0' # TK
  spec.add_runtime_dependency 'kitchen-scribe', '>= 0.0.0' # TK
  spec.add_runtime_dependency 'kitchen-sshgzip', '>= 0.0.0' # TK
  spec.add_runtime_dependency 'kitchen-vagrant', '>= 0.0.0' # TK
  spec.add_runtime_dependency 'kitchen-zcloudjp', '>= 0.0.0' # TK
end
