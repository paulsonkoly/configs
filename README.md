# Configs

[![Build Status](https://travis-ci.org/phaul/configs.svg?branch=master)](https://travis-ci.org/phaul/configs)

Generates config files (dotfiles) from a single source for the following programs when X starts:

  - polybar
  - termite
  - i3
  - ...

For example usage see my [dotfiles](http://github.com/phaul/dotfiles)

## Installation

The gem is not published on rubygems.org, so gem install won't work. You can circumvent this by using bundler, or you can follow these steps:

    # clone the git repo
    $ git clone http://github.com/phaul/configs
    $ cd configs
    # build the gem
    $ gem build ./configs.gemspec
    # install the gem
    $ gem install configs-*.gem

## Usage

Add settings to ~/.config/configs/configs.yml. Execute `configs` when X starts or when you want to re-generate the config files. Example [configs.yml](https://github.com/phaul/dotfiles/blob/zephyrus/.config/configs/configs.yml) from my dotfiles, and example [templates](https://github.com/phaul/dotfiles/tree/zephyrus/.config/configs/templates).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/phaul/configs.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
