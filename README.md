# Guard::Spinoff

Guard::Spinoff is used to integrate the [Spinoff](http://github.com/bernd/spinoff)
server with [Guard](https://github.com/guard/guard).

# Installation

Install the gem.

    $ gem install guard-spinoff

You can also add it to your Gemfile.

```ruby
gem 'guard-spinoff'
```

Initialize or modify a Guardfile by running the following command.

    $ guard init spinoff

# Configuration

Make sure you set the `:runner` and `:init` options in your Guardfile.

```ruby
guard 'spinoff', :runner => :rspec, :init => 'config/spinoff.rb' do
  # ...
end
```

Available runner options: `:rspec`, `:test\_unit`

The `:init` option takes the path to the Spinoff initialization file.

# Caveats

* No test suite yet!

# Credits

Thanks to [Jonathan](https://github.com/jonsgreen) and
[Andrew Assarattanakul](https://github.com/vizjerai) for writing
[guard-spin](https://github.com/vizjerai/guard-spin) which is the base
for this gem.

# Author

* [Bernd Ahlers](https://github.com/bernd)
