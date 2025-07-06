# README

## Commands

Install homebrew
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Yarn
```
npm install -g corepack
```

Setup the project
```bash
bin/setup
```

## Setup

Delete `config/credentials.yml.enc` if it exists, then create a new credentials file:
```bash
EDITOR='nvim' rails credentials:edit
EDITOR='code --wait' rails credentials:edit
```

## Gems

* [amazing_print]()
* [dotenv]() (development, test)
* [meta-tags]()
* [pg]()
* [pry-rails]()
* [pry-rails]()
* [vite_rails]()
* [climate_control]() (test)

## Patterns

* [Service Objects]()
* [Facades]()

# Setup script ideas

* Set application name
* Set database name
* Prepare keys
