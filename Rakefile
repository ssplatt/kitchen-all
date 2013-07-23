require 'bundler/gem_tasks'
require 'gems'

desc 'Update the gemspec to the latest and greatest kitchen-* drivers'
task :update do
  contents = drivers.map do |driver|
    constraint = on_master? ? '>= 0.0.0' : "~> #{driver['version']}"
    "  spec.add_runtime_dependency '#{driver['name']}', '#{constraint}' # TK\n"
  end

  new_spec = gemspec.reject { |line| !line.index('# TK').nil? }
  new_spec.delete_at(-2) if new_spec[-2].strip.empty?
  contents = new_spec[0..-2] + ["\n"] + contents + [new_spec[-1]]

  File.open('kitchen-all.gemspec', 'w') do |f|
    f.write(contents.join(''))
  end

  if on_master?
    contents = drivers.map do |driver|
      if project_url = parse_project_url(driver)
        "gem '#{driver['name']}', :git => '#{project_url}' # TK\n"
      else
        puts "WARN: could not find github project link for #{driver['name']}!"
        nil
      end
    end.compact

    new_gemfile = gemfile.reject { |line| !line.index(' # TK').nil? }
    contents = new_gemfile + contents

    File.open('Gemfile', 'w') do |f|
      f.write(contents.join(''))
    end
  end
end


private
  def gemspec
    IO.readlines('kitchen-all.gemspec')
  end

  def gemfile
    IO.readlines('Gemfile')
  end

  def on_master?
    `git rev-parse --abbrev-ref HEAD`.strip == 'master'
  end

  def parse_project_url(driver)
    return to_git_uri(driver['source_code_uri']) unless driver['source_code_uri'].to_s.strip.empty?
    return to_git_uri(driver['homepage_uri']) if driver['homepage_uri'].to_s =~ /github/
    nil
  end

  def to_git_uri(uri)
    split = uri.chomp('/').split('/')
    "git://#{split[2]}/#{split[3]}/#{split[4]}.git"
  end

  def drivers
    @drivers ||= Gems.search('kitchen-').
      reject { |driver| driver['name'] == 'kitchen-all' }.
      sort_by { |driver| driver['name'] }
  end

