# Newrelic::Sidekiq::Stats

This is a NewRelic Sampler for Sidekiq custom metrics. 
It will sample the Sidekiq stats and create a custom metric for NewRelic. 
You can view the information in the NewRelic insights or in NewRelic One.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'newrelic-sidekiq-stats'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install newrelic-sidekiq-stats

## Usage

* Install the gem
* Create a dashboard on the NewRelic insights or NewRelic One

NQRL example: 
```
SELECT rate(average(newrelic.timeslice.value), 1 minute) 
FROM Metric 
WHERE appName ='My App Name' 
WITH METRIC_FORMAT 'Custom/Sidekiq/ScheduledSize' 
TIMESERIES LIMIT 10 SINCE 1800 seconds ago
```

Available metrics:

* `Custom/Sidekiq/ProcessedSize`
* `Custom/Sidekiq/FailedSize`
* `Custom/Sidekiq/ScheduledSize`
* `Custom/Sidekiq/RetrySize`
* `Custom/Sidekiq/DeadSize`
* `Custom/Sidekiq/EnqueuedSize`
* `Custom/Sidekiq/ProcessesSize`
* `Custom/Sidekiq/WorkersSize`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/newrelic-sidekiq-stats. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/newrelic-sidekiq-stats/blob/master/CODE_OF_CONDUCT.md).


## Code of Conduct

Everyone interacting in the Newrelic::Sidekiq::Stats project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/newrelic-sidekiq-stats/blob/master/CODE_OF_CONDUCT.md).
