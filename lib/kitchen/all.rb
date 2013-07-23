require 'gems'

module Kitchen
  module All
    require 'kitchen/all/version'
    extend self

    def on_master?
      `git rev-parse --abbrev-ref HEAD`.strip == 'master'
    end

    def driver_specs(spec)
      drivers.each do |driver|
        constraint = on_master? ? nil : "~> #{driver['version']}"
        spec.add_runtime_dependency(driver['name'], constraint)
      end
    end

    def drivers_latest(gemfile)
      drivers.each do |driver|
        if project_url = parse_project_url(driver)
          gemfile.gem(driver['name'], :git => project_url)
        else
          puts "WARN: could not find github project link for #{driver['name']}!"
        end
      end
    end

    private
      def drivers
        @drivers ||= Gems.search('kitchen-').reject { |driver| driver['name'] == 'kitchen-all' }
      end

      def parse_project_url(driver)
        return driver['source_code_uri'].chomp('/') unless driver['source_code_uri'].to_s.strip.empty?
        return driver['homepage_uri'].chomp('/') if driver['homepage_uri'].to_s =~ /github/
        nil
      end
  end
end
