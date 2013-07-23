require 'bundler/gem_tasks'

desc 'Update the gemspec to the latest and greatest kitchen-* drivers'
task :update do

end

def fetch_gem_specs
  require 'rubygems/spec_fetcher'

  req = Gem::Requirement.default
  dep = Gem::Deprecate.skip_during { Gem::Dependency.new(/kitchen-/i, req) }
  fetcher = Gem::SpecFetcher.fetcher

  specs = fetcher.spec_for_dependency(dep, false)
  specs.first.map { |t| { name: t.first.name, version: t.first.version } }
end
