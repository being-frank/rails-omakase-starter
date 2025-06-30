# README

## Commands

Homebrew dependencies
```bash
brew bundle install
```

Ruby gems
```bash
bundle install
```

## Setup

Delete `config/credentials.yml.enc` if it exists, then create a new credentials file:
```bash
EDITOR='nvim' rails credentials:edit
EDITOR='code --wait' rails credentials:edit
```
