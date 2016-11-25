# KeywordStruct

[![Build Status](https://travis-ci.org/mru2/keyword_struct.svg?branch=master)](https://travis-ci.org/mru2/keyword_struct)
[![Gem Version](https://badge.fury.io/rb/keyword_struct.svg)](https://badge.fury.io/rb/keyword_struct)

Generates a struct-like class with the following properties :
- only initializable via keyword arguments
- all arguments are mandatory
- only readers, no setters

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'keyword_struct'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install keyword_struct

## Usage

```ruby
User = KeywordStruct.new(:first_name, :last_name) do
  def full_name
    [first_name, last_name].join(' ')
  end
end

user = User.new(first_name: 'John', last_name: 'Doe')
user.full_name
# => "John Doe"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mru2/keyword_struct.

