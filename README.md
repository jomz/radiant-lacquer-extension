# Radiant Lacquer Extension

[![Build Status](https://secure.travis-ci.org/radiant/radiant-clipped-extension.png)](http://travis-ci.org/radiant/radiant-clipped-extension)

Lacquer support for Radiant CMS.

The Lacquer extension makes Lacquer play nicely with Varnish.
As the [Lacquer gem][lacquer] requires Ruby 1.9, so does this extension.

Please file bugs and feature requests on [Github][issues].

[issues]: https://github.com/jomz/radiant-lacquer-extension/issues
[lacquer]: https://github.com/russ/lacquer

## Installation

Add this gem via bundler:

    gem 'radiant-lacquer-extension' && bundle install

Run `rake radiant:extensions:lacquer:update`. This will add the following files:

* RAILS_ROOT/config/varnishd.yml
* RAILS_ROOT/config/varnishd.vcl.erb
* RAILS_ROOT/config/initializers/lacquer.rb

You will want to update lacquer.rb and varnishd.yml

Installation of Varnish itself is not covered in this README.


## Purge strategy



## Contributions

If you would like to contribute, please [fork the project][fork] and submit a [pull request][pull-request].

[fork]: http://help.github.com/fork-a-repo/
[pull-request]: http://help.github.com/send-pull-requests/

Pull requests with working tests are preferred and have a greater chance of being merged.

## TODO

* Add tests!
* Allow configuration of purge strategy

## Authors

* Benny Degezelle

Released under the same terms as Radiant.