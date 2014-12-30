THAT
====

*The Rails console all-purpose thing finding machine.*

The GitHub Rails app has a nice helper method in the console called `dat` that gets
you the right thing from an assortment of models based on a string. This is something
similar intended for generic use (not based on the same implementation at all,
i just wanted to be able to type `dat :thedaniel` in all my Rails apps).

Searches all AR models in a Rails app for matches to a string. Checks [DEFAULT_TO_THAT_KEYS](https://github.com/thedaniel/that/blob/master/lib/that.rb#L2)
unless the model has a `:to_that` class method that returns an array of symbols to check against.

Returns the match if there's only one, otherwise an array of matches.

```
irb(main):001:0> that 'thedaniel'
  User Load (39.2ms)  SELECT "users".* FROM "users" WHERE "users"."name" = 'thedaniel'
  User Load (0.5ms)  SELECT "users".* FROM "users" WHERE "users"."login" = 'thedaniel'
  User Load (38.0ms)  SELECT "users".* FROM "users" WHERE "users"."email" = 'thedaniel'
  OtherModel Load (39.2ms)  SELECT "other_models".* FROM "other_models" WHERE "other_models"."specified_field" = 'thedaniel'
  OtherModel Load (0.5ms)  SELECT "other_models".* FROM "other_models" WHERE "other_models"."other_field" = 'thedaniel'
=> #<User id: 167035, login: "thedaniel">
```

Call `That.activate` to monkey patch Object and make it work.

I personally use this `.irbrc`:

```ruby
if defined?(Rails) && defined?(That)
  That.activate
end
```
