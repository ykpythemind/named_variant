# NamedVariant

[![Gem Version](https://badge.fury.io/rb/named_variant.svg)](https://badge.fury.io/rb/named_variant)
[![Build Status](https://github.com/ykpythemind/named_variant/workflows/CI/badge.svg)](https://github.com/ykpythemind/named_variant/actions)

Make ActiveStorage's variant named and configurable.

Usual process is

```ruby
class User < ActiveRecord::Base
  has_one_attached :avatar
end
```

and view.

```ruby
= image_tag(user.avatar.variant(resize: "100x100", monochrome: true, flip: "-90").processed)
```

It's annoying, and sometimes not DRY. NamedVarient gives a solution.

```ruby
class User < ActiveRecord::Base
  has_one_attached :avatar

  variant_name :monochrome, resize: "100x100", monochrome: true, flip: "-90"
end
```

```ruby
= image_tag(user.avatar.variant(:monochrome).processed)
# only user's attachment can call `monochrome` variant.
```

## Installation

```ruby
gem 'named_variant'
```

And then execute:
```bash
$ bundle
```

## Todo

- [ ] scoped variant name support
- [ ] config file support

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
