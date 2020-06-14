require_relative 'lib/newrelic_sidekiq_stats/version'

Gem::Specification.new do |spec|
  spec.name          = "newrelic-sidekiq-stats"
  spec.version       = NewRelic::SidekiqStats::VERSION
  spec.authors       = ["Benoist Claassen"]
  spec.email         = ["benoist.claassen@gmail.com"]

  spec.summary       = %q{Send sidekiq queue stats to new relic}
  spec.description   = %q{Monitor the queue sizes with new relic}
  spec.homepage      = "https://github.com/benoist/newrelic-sidekiq-stats"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'newrelic_rpm'
  spec.add_dependency 'sidekiq'
end
