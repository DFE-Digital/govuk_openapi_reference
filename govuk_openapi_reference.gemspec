require_relative "lib/govuk_openapi_reference/version"

Gem::Specification.new do |spec|
  spec.name          = "govuk_openapi_reference"
  spec.version       = GovukOpenapiReference::VERSION
  spec.authors       = ["Tijmen Brommet"]
  spec.email         = ["tijmen@gmail.com"]

  spec.summary       = "Convert an OpenAPI spec into GOV.UK-flavoured HTML"
  spec.homepage      = "https://github.com/DFE-Digital/govuk_openapi_reference"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = %w[lib]

  spec.add_dependency "activesupport"
  spec.add_dependency "openapi3_parser"
  spec.add_dependency "redcarpet"
  spec.add_dependency "rouge"

  spec.add_development_dependency "bundler", "~> 2.1.4"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "capybara", "~> 3.32"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.9.0"
  spec.add_development_dependency "rubocop-govuk", "~> 3.5.0"
end
