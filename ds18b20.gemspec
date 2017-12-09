
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ds18b20/version"

Gem::Specification.new do |spec|
  spec.name          = "ds18b20"
  spec.version       = Ds18b20::VERSION
  spec.authors       = ["Owais"]
  spec.email         = ["owaiswiz@gmail.com"]

  spec.summary       = %q{A Gem to easily interface with the DS18B20 Temperature Sensor Over 1-Wire}
  spec.homepage      = "https://github.com/owaiswiz/ds18b20.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
