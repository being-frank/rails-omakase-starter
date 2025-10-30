module KitsuneUI
  class Engine < ::Rails::Engine

    isolate_namespace KitsuneUI

    engine_name 'kitsune_ui'

    config.autoload_paths << root.join(*%w[app frontend components])

    initializer 'kitsune_ui.inflections' do
      ActiveSupport::Inflector.inflections(:en) do |inflect|
        inflect.acronym 'UI'
      end
    end

    initializer 'kitsune_ui.view_component' do
      ActiveSupport.on_load(:view_component) do
        # Make it possible to store previews in sidecar folders
        # https://github.com/palkan/view_component-contrib#organizing-components-or-sidecar-pattern-extended
        # ::ViewComponent::Preview.extend(ViewComponentContrib::Preview::Sidecarable)

        # Enable `self.abstract_class = true` to ignore previews
        # ::ViewComponent::Preview.extend(ViewComponentContrib::Preview::Abstract)
      end
    end

    config.before_configuration do
      config.lookbook = Lookbook.config

      config.lookbook.project_name = 'KitsuneUI'
      config.lookbook.ui_theme     = 'rose'
    end

    config.after_initialize do
    end

  end
end
