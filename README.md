# ShoesDatePicker

ShoesDatePicker gem provides a date picker functionality for the shoes gui toolkit.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'shoes_date_picker'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install shoes_date_picker

## Usage

1. require 'shoes_date_picker'
2. call the shoes_date_picker method and capture the selected date:
```ruby
    button "Select deadline" do
        @deadline = shoes_datepicker
    end
```  
Optionally, pass in the background color to the widget:
```ruby
    button "Select deadline" do
        @deadline = shoes_datepicker(green)
    end
``` 
The deafult color is set to deepskyblue.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/shoes_date_picker. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

