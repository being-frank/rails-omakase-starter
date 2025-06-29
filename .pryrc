# frozen_string_literal: true

require 'amazing_print'
require 'pry-stack_explorer'

app_env        = ENV['X_APP_ENV'].presence || Rails.env
pry_time       = Time.current.strftime('%H:%M')
pry_app_name   = Pry::Helpers::Text.magenta(Rails.application.class.name.split('::').first.underscore)
pry_env        = app_env == 'production' ? Pry::Helpers::Text.red(app_env) : Pry::Helpers::Text.yellow(app_env)
pry_git_branch = Pry::Helpers::Text.green(`git rev-parse --abbrev-ref HEAD`.squish)

Pry.config.pager  = false
Pry.config.color  = true
Pry.config.prompt = Pry::Prompt.new(
  :custom,
  'Custom prompt',
  [
    proc do |context, nesting, pry_instance, _sep|
      pry_nesting    = "(#{context})#{nesting > 0 ? ":#{nesting}" : ''}"
      pry_input_ring = Pry::Helpers::Text.white_on_black("[#{pry_instance.input_ring.count}] #{pry_time}")

      "#{pry_input_ring} #{pry_nesting} #{pry_app_name}:#{pry_git_branch} #{pry_env}> "
    end
  ]
)

AmazingPrint.defaults = {
  indent:        -2,
  index:         false,
  ruby19_syntax: true
}

AmazingPrint.pry!
