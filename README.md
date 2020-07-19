# Configs

[![Build Status](https://travis-ci.org/phaul/configs.svg?branch=master)](https://travis-ci.org/phaul/configs)

Generates config files (dotfiles) from a single source for the following programs when X starts:

  - polybar
  - termite
  - i3

For example usage see my [dotfiles](http://github.com/phaul/dotfiles)

## Installation

    $ gem install configs

## Usage

Add settings to ~/.config/configs/configs.yml. Execute configs when X starts or wwhen you want to re-generate the config files. Example [configs.yml](https://github.com/phaul/dotfiles/blob/zephyrus/.config/configs/configs.yml) from my dotfiles, and example [templates](https://github.com/phaul/dotfiles/tree/zephyrus/.config/configs/templates).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/phaul/configs.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
