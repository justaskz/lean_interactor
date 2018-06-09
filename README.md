# LeanInteractor

Interactor is a stateless class intended to do one action. It is like function in functional languages.

If you are working with Rails, interactor is a perfect place to put your bussines logic and keep controllers and models light and clean.

## Usage

Include `LeanInteractor` to your class and define `run` method:

```ruby
class Users::Create
  include LeanInteractor

  initialize_call :user_params

  def run
    # user creation logic goes here
  end
end
```

And then call your interactor:
```ruby
Users::Create.call(user_params)
```

`LeanInteractor` provides three helper methods: `initialize_call`, `initialize_run` and `initialize_for`. They generate corresponding execution methods: `call`, `run` and `for`. Use them depending on your preference.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lean_interactor'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lean_interactor

## Motivation

This gem was created to reduce amount of the boilerplate code needed to define an interactor:

##### Without LeanInteractor

```ruby
class Users::Create
  def self.for(user_params)
    new(user_params).run
  end

  attr_reader :user_params

  def initialize(user_params)
    @user_params = user_params
  end

  def run
    # user creation logic goes here
  end
end
```

##### With LeanInteractor

```ruby
class Users::Create
  include LeanInteractor

  initialize_for :user_params

  def run
    # user creation logic goes here
  end
end
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
