# Radiant Lacquer Extension

Lacquer support for Radiant CMS.

The Lacquer extension uses the [Lacquer gem][lacquer] to send purge commands to Varnish. As Lacquer requires Ruby 1.9, so does this extension.

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

This extension hooks into Admin::ResourceController to send purge commands through Lacquer. For any model class except Page, a global purge is performed after every CUD (create update destroy) action.

For pages, a CUD action will purge the cache for that page, all it's descendants, all it's ancestors and their descendants, except for the home page's descendants.

Assuming these pages exist in the cache:

/
/about
/about/team
/about/team/freelancers
/about/contact
/blog
/blog/2012/01/12/varnish-is-so-awesome
/portfolio

An update to /about/team will purge the following pages;

/about/team
/about/team/freelancers   (because it's a descendant of /about/team)
/about                    (because it's an ancestor of /about/team)
/about/contact            (because it's a descendant of /about)
/                         (because it's the home page)

But leave the cache for /blog and /portfolio alone. The idea is to avoid unnecessary purging. This strategy may not be 100% fit for your site.
For example if on /portfolio you render content from /about (e.g. via r:find), this page will be stale, but not purged.
To overwrite this behavior, you will want to change clear\_model\_cache\_with\_lacquer in Admin::ResourceController.


## Contributions

If you would like to contribute, please [fork the project][fork] and submit a [pull request][pull-request].

[fork]: http://help.github.com/fork-a-repo/
[pull-request]: http://help.github.com/send-pull-requests/

Pull requests with working tests are preferred and have a greater chance of being merged.

## TODO

* Add tests!
* Make purge strategy configurable

## Authors

* Benny Degezelle

Released under the same terms as Radiant.