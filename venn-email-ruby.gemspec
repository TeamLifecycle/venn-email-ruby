# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'venn/email/ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "venn-email-ruby"
  spec.version       = Venn::Email::Ruby::VERSION
  spec.authors       = ["Alex Sears"]
  spec.email         = ["alexwsears@gmail.com"]

  spec.summary       = %q{Venn Email Redundancy Package}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/VennHQ/venn-email-ruby"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = ""
  end

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
