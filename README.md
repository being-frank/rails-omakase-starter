# README

## Prerequisites

* [Homebrew](https://brew.sh)
* [Ruby](https://www.ruby-lang.org) `~> 3.4`
* [Node.js](https://nodejs.org) `~> 22.16.0`
* [Yarn](https://yarnpkg.com) `~> 4.9.2`

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
EDITOR='nvim' rails credentials:edit
EDITOR='code --wait' rails credentials:edit
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
