# frozen_string_literal: true

require_relative "lib/marriage_profiles/version"

Gem::Specification.new do |spec|
  spec.name = "marriage_profiles"
  spec.version = MarriageProfiles::VERSION
  spec.authors = ["Your Name"]
  spec.email = ["your.email@example.com"]

  spec.summary = "A plugin for managing marriage profiles"
  spec.description = "This plugin allows users to create and manage marriage profiles"
  spec.homepage = "https://example.com"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/yourusername/marriage_profiles"
  spec.metadata["changelog_uri"] = "https://github.com/yourusername/marriage_profiles/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", ">= 7.0.0"
  spec.add_dependency "carrierwave", ">= 2.2.0"
  spec.add_dependency "mini_magick", ">= 4.11.0"
  spec.add_dependency "importmap-rails", ">= 1.2.0"
  spec.add_dependency "turbo-rails", ">= 1.5.0"
  spec.add_dependency "stimulus-rails", ">= 1.3.0"

  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "factory_bot_rails"
  spec.add_development_dependency "faker"
end
