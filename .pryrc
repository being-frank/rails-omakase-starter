require 'amazing_print'

pry_time          = Time.current.strftime('%H:%M')
pry_rails_env     = Rails.env.to_sym
pry_project_name  = Pry::Helpers::Text.blue(Rails.application.class.module_parent_name)
pry_formatted_env = case pry_rails_env
when :production
  Pry::Helpers::Text.red(pry_rails_env)
when :staging
  Pry::Helpers::Text.yellow(pry_rails_env)
else
  Pry::Helpers::Text.green(pry_rails_env)
end

Pry.config.pager  = false
Pry.config.color  = true
Pry.config.prompt = Pry::Prompt.new(
  :custom,
  "Includes the current time, project name, git branch and current app environment.\n" \
  "[1] 20:51 ApplicationName [development] pry(main)",
  [
    proc do |context, nest_level, pry, sep|
      pry_input_ring = "#{pry_time} [#{pry.input_ring.count}]"

      "#{pry_input_ring} " \
      "#{pry_project_name} [#{pry_formatted_env}] " \
      "#{pry.config.prompt_name}(#{::Pry.view_clip(context)})" \
      "#{":#{nest_level}" if !nest_level.zero?} "
    end
  ]
)

AmazingPrint.defaults = {
  indent:        -2,
  index:         false,
  ruby19_syntax: true
}

AmazingPrint.pry!
