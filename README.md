# Tired of Dating?

Date UTC Parser was written so that I could guarantee to either get back a UTC Date Time object, or nil - while writing some API's for mobile apps.  That's all I wanted, and that's what this guy does.

Along with that, it will return the humanized UTC example string, and it contains the regex that will match that string, can be used for error handling.

# Using It

Install it as a gem

```bash
gem install date_utc_parser
```

Require it in your app

```ruby
require 'date_utc_parser'
```

Start using it.

# Some Examples

## Time Object to UTC Time Object

```ruby
unparsed_time = Time.now
unparsed_time.utc? #=> false 
parsed_time = DateUtcParser.parse unparsed_time # => 2012-07-07 18:59:02 UTC 
parsed_time.utc? #=> true 
```

## UTC Time String to UTC Time Object

```ruby
unparsed_time = "2012-07-08T12:13:14Z"
parsed_time = DateUtcParser.parse unparsed_time # => 2012-07-08 12:13:14 UTC
parsed_time.utc? #=> true 
```

## Everything else

```ruby
unparsed_time = "white russian"
parsed_time = DateUtcParser.parse unparsed_time # => nil
```

# Contribute

Fork it, branch your topic, test it, make a pull request.

I suggest you bounce your idea off of me first so you don't make wasted effort.