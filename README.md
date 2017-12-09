NOTE: In Development

[![Build Status](https://travis-ci.org/owaiswiz/ds18b20.svg?branch=master)](https://travis-ci.org/owaiswiz/ds18b20)

# DS18B20

This gem makes interfacing with the DS18B20 temperature easier over 1-Wire.


After setting it up correctly make sure you have the correct file path where it's output is being recorded.
The file name on raspberry pi should be `w1_slave`. If you don't know where the file is located - please read : [DS18B20 - Temperature Sensing](https://learn.adafruit.com/adafruits-raspberry-pi-lesson-11-ds18b20-temperature-sensing?view=all).


After making sure that you have the file path and that output looks similar to one in the tutorial above, you can easily use this gem following the instructions below (not yet released - soon).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ds18b20'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ds18b20

## Usage

In-development

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/owaiswiz/ds18b20.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
