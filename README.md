# NamedVariant

Make ActiveStorage's variant named and configurable.

e.g. model

```ruby
class User < ActiveRecord::Base
  has_one_attached :avatar
end
```

and view

```ruby
= image_tag(avatar.variant(resize: "100x100", monochrome: true, flip: "-90").processed)
```

It's annoying, and sometimes not DRY. NamedVarient gives a solution.

```ruby
class User < ActiveRecord::Base
  has_one_attached :avatar

  variant :monochrome, resize: "100x100", monochrome: true, flip: "-90"
end
```

```ruby
= image_tag(avatar.variant(:monochrome).processed)
```

## Usage

## Installation

```ruby
gem 'named_variant'
```

And then execute:
```bash
$ bundle
```

## Contributing

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
