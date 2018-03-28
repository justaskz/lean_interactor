lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lean_interactor/version'

Gem::Specification.new do |spec|
  spec.name          = 'lean_interactor'
  spec.version       = LeanInteractor::VERSION
  spec.authors       = 'Justas Kazakauskas'
  spec.email         = 'leakymirror@gmail.com'

  spec.summary       = 'LeanInteractor reduces boilerplate code while defining interactor classes'
  spec.description   = 'LeanInteractor reduces boilerplate code while defining interactor classes.'
  spec.homepage      = 'https://github.com/justaskz/lean_interactor'
  spec.license       = 'MIT'

  spec.required_ruby_version = '>= 2.0'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'pry', '~> 0.11.3'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.7'
end
