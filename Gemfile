source 'https://rubygems.org'
gemspec

require 'kitchen/all'
if Kitchen::All.on_master?
  Kitchen::All.drivers_latest(self)
end
