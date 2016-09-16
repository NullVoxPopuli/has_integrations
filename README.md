# has_integrations
Rails gem for a pattern to manage 3rd party service integrations


## Install

```ruby
gem 'has_integrations'
```

or

```bash
gem install has_integrations
```

Once the gem is installed, in your app, run

```bash
rails generate has_integrations:install
```

Which will set up the `Integration` Model and a migration for the `Integration` model.

## Usage

```ruby
class User < ApplicationRecord
  # ...

  has_many :integrations,
    dependent: :destroy, extend: HasIntegrations,
    as: :owner

  # ...
end
```

### Working with Integrations


```ruby
# Get Stripe Integration.
stripe_integration = user.integrations[:stripe]

# Set Stripe Integration.
# This will create and save a new integration
# if there wasn't already a stripe integration record.
user.integrations[:stripe] = { "livemode" => false, "stripe_user_id" => 1 }

# Check if an Integration exists.
user.integrations.has?(:stripe)
# => true or false
```

This gem assumes each owning object can only have one type of each integration.


## Configuration

In `config/initializers/has_integrations.rb`:

```ruby
HasIntegrations.encryption_key = 'my great key'
```
Used for `attr_encrypted` on the config column

## Validations

With the built in `Integration` class, you can monkey patch to add validations / whatever other logic.

## TODO

- Allow the generate to be passed an existing `Integration` class. This may be a weird config option, because the `Integration` class needs `kind`, `encrypted_config`, `owner_id`, and `owner_type` -- would all these columns need to be configurable?

## Contributing

 - Fork
 - Open a PR
 - :-)
