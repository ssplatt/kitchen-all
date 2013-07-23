kitchen-all
===========
Sometimes you just want all the test-kitchen drivers known to man. And that's what `kitchen-all` does!


Installation
------------
Add this line to your cookbooks's Gemfile:

```ruby
gem 'kitchen-all'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kitchen-all

If you want the bleeding edge of all the kitchen drivers, just depend on the `master` branch of `kitchen-all`:

```ruby
gem 'kitchen-all', github: 'sethvargo/kitchen-all'
```


Contributing
------------
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


License and Author
------------------
- Author: Seth Vargo (sethvargo@gmail.com)

```text
Copyright 2013 Seth Vargo <sethvargo@gmail.com>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
