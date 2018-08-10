# Sputnik

[![CircleCI](https://circleci.com/gh/dungeonmaster18/sputnik/tree/master.svg?style=svg)](https://circleci.com/gh/dungeonmaster18/sputnik/tree/master)
[![Maintainability](https://api.codeclimate.com/v1/badges/dc6dff0353cdeaada337/maintainability)](https://codeclimate.com/github/dungeonmaster18/sputnik/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/dc6dff0353cdeaada337/test_coverage)](https://codeclimate.com/github/dungeonmaster18/sputnik/test_coverage)

Sputnik is a driver application platform, where drivers can apply to become the go-jek driver by submitting their details and documents.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Setup Local Development 

To setup this project for your local development you require following: 

#### Pre-requisite 

* Ruby version:

    ```2.5.1```
* Database Type:

    ```Postgresql v10.4```
* Sidekiq:
* Redis server:

#### Build Project

It uses bundle.

```bundle install```

### Test project

It uses rspec as a testing framework and simplecov as for coverage.

```bundle exec rake```

### Start local development server

```bundle exec rails server RAILS_ENV=DEVELOPMENT```

### Start Redis server
``` redis-server ```

### Start Sidekiq
``` bundle exec sidekiq -q default -q mailers ```
