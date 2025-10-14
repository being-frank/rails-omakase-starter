# README

Project generated using:

```sh
rails new rails-quick-start --database=postgresql --css=tailwind --javascript=bun --skip-test
```

## Prerequisites

* [Homebrew](https://brew.sh)
* [Ruby](https://www.ruby-lang.org) `~> 3.4`
* [Bun](https://bun.com) `~> 1.3`

## Setup

```sh
bin/setup
```
Steps:
* Libraries via homebrew
* Bundler and Ruby gems
* Installing Javascript packages
* Setup `.env`
* Credentials
* Database
* Cleanup

### Edit credentials

_[Include description]_

```sh
EDITOR='nvim' rails credentials:edit -e development | staging | production
EDITOR='code --wait' rails credentials:edit -e development | staging | production
```

## MailHog

_[Include description]_

[Install manually](https://github.com/mailhog/MailHog?tab=readme-ov-file#installation) or,
via Docker Compose:

```sh
docker compose up -d
```

## Gems

* [amazing_print]()
* [climate_control]() (test)
* [dotenv-rails]() (development, test)
* [factory_bot_rails]() (development, test)
* [meta-tags]()
* [pg]()
* [pry-rails]()
* [rspec-rails]() (development, test)
* [ruby-lsp]() (tools)
* [simplecov]() (test)
* [single_cov]() (test)
* [squasher]() (tools)
* [vite_rails]()
* [webmock]() (test)

## Patterns

* [Service Objects]()
* [Facades]()

### Setup script ideas

* Set application name
* Set database name
* Prepare keys
