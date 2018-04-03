# LeanInteractor

Interactor is a stateless class intended to do one action. It is like function in functional languages. This gem is created to reduce amount of the boilerplate code needed to define an interactor:

##### Without LeanInteractor
```ruby
class Emails::Send
  def self.for(user)
    new(user).run
  end

  attr_reader :user

  def initialize(user)
    @user = user
  end

  def run
    # email sending logic goes here
  end
end
```

##### With LeanInteractor
```ruby
class Emails::Send
  include LeanInteractor

  initialize_with :user

  def run
    # email sending logic goes here
  end
end
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lean_interactor'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lean_interactor

## Usage

Define interactor like this:

```ruby
class Emails::Send
  include LeanInteractor

  initialize_with :user

  def run
    # email sending logic goes here
  end
end
```

And then call it:
```ruby
Emails::Send.for(user)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/justaskz/lean_interactor. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the LeanInteractor project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/justaskz/lean_interactor/blob/master/CODE_OF_CONDUCT.md).
