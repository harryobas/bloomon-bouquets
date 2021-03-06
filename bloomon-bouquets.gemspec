lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "bloomon/bouquets/version"

Gem::Specification.new do |spec|
  spec.name          = "bloomon-bouquets"
  spec.version       = Bloomon::Bouquets::VERSION
  spec.authors       = ["harry obaseki"]
  spec.email         = ["harryobas@gmail.com"]

  spec.summary       = "Generates flower bouquets"
  spec.description   = "A library for generating flower bouquets from a bouquet spec and flower stream input"
  spec.homepage      = "https://github.com/harryobas/bloomon-bouquets"
  spec.license       = "MIT"

  #spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  #spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = ["bouquet"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
