ruby_osx_app
------------

This gem operates on Mac OSX Applications to retrieve information from them.

Example usage
-------------

Get version from app:

```ruby
require 'osx_app'
osx_app = OsxApp.new('/Applications/1Password.app')
osx_app.version # => 4.0.3
osx_app.version_major # => 4
```

You can initialize simpler:

```ruby
osx_app = OsxApp.new('1Password.app')
```

Or even more simpler:

```ruby
osx_app = OsxApp.new('1Password')
```

You can also get info from custom path app:

```ruby
osx_app = OsxApp.new('/Volumes/ExternalDisk/Applications/1Password.app')
```

Contributing to ruby_osx_app
----------------------------

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

Copyright
---------

Copyright (c) 2013 Marcin Nowicki. See LICENSE.txt for
further details.

