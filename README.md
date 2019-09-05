# CircularArray

You have a week with days and you want to iterate over the week and never met `nil`, but:
```ruby
week = [:mon, :tue, :wed, :thu, :fri, :sat, :sun]
week[0] # => :mon
week[3] # => :thu
week[6] # => :sun
week[7] # => nil... stop what?! I need monday!
```

But it's possible with `CircularArray`
```ruby
require 'circular_array'

circular_week = CircularArray[:mon, :tue, :wed, :thu, :fri, :sat, :sun]

# It behaves like Array. Basically it inherits Array:
circular_week.kind_of? Array # => true

# But it is endless:
circular_week[0] # => :mon
circular_week[3] # => :thu
circular_week[6] # => :sun
circular_week[7] # => :mon
circular_week[8] # => :tue
circular_week[9] # => :wed
circular_week[10] # => :thu
circular_week[11] # => :fri
circular_week[12] # => :sat
circular_week[13] # => :sun
circular_week[14] # => :mon
# great!
```

**You can use it for recursive matching, but do not forget to add anti-infinity loop clause**

Only for empty collection in returns `nil`
```ruby
empty_circular_array = CircularArray.new([])
empty_circular_array[1] # => nil
```

## Use cases

1. Matching over a list of possible solutions
2. Cycling dates for complex delivery logic
3. ...


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'circular_array'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install circular_array


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/circular_array. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the CircularArray project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/circular_array/blob/master/CODE_OF_CONDUCT.md).
