# Uptimr

Uptimr is a *very* basic Ruby wrapper for the most excellent [Uptime](https://github.com/fzaninotto/uptime), a Node.js remote application monitoring tool. This wrapper is designed to import data using Uptime's API and transform points more familiar Ruby types

## Installation

```ruby
gem install uptimr
```

or put it in your Gemfile

```ruby
gem "uptimr"
```

Then initialize Uptimr to point to your Uptime API

```ruby
Uptimr.config |config| do
	config.base_url = "https://yoursite.com/status"
end
```

## Usage

To download your entire list of checks and its associated data

```ruby
Uptimr::Check.list
```

This will return an array of check objects with the following attributes

* id (String) API id for check
* is_up (Boolean) Indicates if service currently responds to ping
* first_tested (Time) Time when this check was first tested
* last_tested (Time) Time when this check was last tested
* name (String) Name of the check
* url (String) URL of the check
* count (Number) Number of samples taken to calculate statistical data
* responsiveness (Number) % responsiveness of service in a number ranging 0..1
* response_time (Number) The mean response time in ms
* availability (Number) % uptime of service in a number ranging 0..1

Note that this wrapper doesn't currently pull hourly, daily or monthly data yet

To look up an individual check by id number, use the following

```ruby
Uptimr::Check.find(id)
```

## Todo

* Allow for basic HTTP authentication
* Pull hourly, daily & monthly data on checks

## License

MIT