# Bloomon::Bouquets

An application that takes the design specs (the rules) and the stream of flowers as an input, and produce the stream of bouquets as an output. Can also be included is a gem (library) in other applications/projects.

## Installation

To use as a gem/library in other applications/projects

Add this line to your application's Gemfile:

```ruby
gem 'bloomon-bouquets'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bloomon-bouquets

## Usage

To run as a console application, make sure to have docker installed on your machine and
follow the instructions below:

1. $ git clone https://github.com/harryobas/bloomon-bouquets.gits
2. $ cd bloomon-bouquets
3. $ sudo docker build -t "bloomon"
4. $ sudo docker run  -i -t bloomon:latest
5. bloomon-bouquet# bin/bouquet input.txt

NB: The file input.txt is already included in the project root folder

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).
