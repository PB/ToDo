ToDo
================
[![Code Climate](https://codeclimate.com/github/PB/ToDo/badges/gpa.svg)](https://codeclimate.com/github/PB/ToDo)
[![Test Coverage](https://codeclimate.com/github/PB/ToDo/badges/coverage.svg)](https://codeclimate.com/github/PB/ToDo/coverage)

Ruby on Rails
-------------

This application requires:

- Ruby 2.2.0
- Rails 4.2.4

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).

Getting Started
---------------

Steps:

* bundle install
* configure database access
* mv application.yml.example application.yml
* configure websocket
* start ws server ws_pass="password" thin -R socky/config.ru -p3001 start
* rake db:migrate
* rails s
