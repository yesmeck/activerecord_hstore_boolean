# Activerecord Hstore Boolean

A activerecord extesion allow you use boolean in hstore.

## Installation

Add this line to your application's Gemfile:

    gem 'activerecord_hstore_boolean'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activerecord_hstore_boolean

## Usage

Set boolean values.

```ruby
class Product < ActiveRecord::Base
  hstore_boolean_values :properties, :popular
end

```

Now you can use boolean values.

```ruby
product = Product.create(properties: { popular: true, color: 'white' })
product.properties['popular'] #=> true
```

Following values will be considered to be true, otherwise, to be false.

```ruby
TRUE_VALUES = [true, 1, '1', 't', 'T', 'y', 'Y', 'yes', 'YES', 'true', 'TRUE']
```

## Contributing

1. Fork it ( http://github.com/yesmeck/activerecord_hstore_boolean/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
