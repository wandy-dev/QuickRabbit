# QuickRabbit
[![Build Status](https://travis-ci.org/wandy-dev/QuickRabbit.svg?branch=master)](https://travis-ci.org/wandy-dev/QuickRabbit)

A quick and simple way to encode strings to produce QR code images

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'quick_rabbit'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install quick_rabbit

## Usage

### Configuration

set the directory and image size
```ruby
QuickRabbit.configure do |config|
  config.directory = directory
  config.img_size = img_size
end
```
`directory` specify the directory to place the image after encoding
`img_size` specify the size of QR dots in pixels (default 3)

### Encoding

```ruby
QuickRabbit.encode(data: data, file_name: file_name)
```
`data` specify a string with the data to encode
`file_name` specify the name of the file to output (extension is provided by the gem)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/wandy-dev/quick_rabbit.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
