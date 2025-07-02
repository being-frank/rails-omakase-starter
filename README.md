# README

## Commands

Homebrew dependencies
```bash
brew bundle install
```

Ruby gems
```bash
bundle install

Yarn
```
npm install -g corepack
```

## Setup

Delete `config/credentials.yml.enc` if it exists, then create a new credentials file:
```bash
EDITOR='nvim' rails credentials:edit
EDITOR='code --wait' rails credentials:edit
```

## Gems

* [pg]()
* [vite_rails]()
* [pry-rails]()

## Patterns

* [Service Objects]()
* [Facades]()
