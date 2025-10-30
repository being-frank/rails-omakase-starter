require 'kitsune_ui/version'
require 'kitsune_ui/engine'

require 'action_view/railtie'
require 'dry-initializer-rails'
require 'dry-types'
require 'lookbook'
require 'tailwind_merge'
require 'view_component'
require 'view_component-contrib'

module KitsuneUI

  extend ActiveSupport::Autoload

  # autoload :DesignTokens,          'kitsune_ui/design_tokens'
  # autoload :DryTypes,              'kitsune_ui/dry_types'
  # autoload :Favicons,              'kitsune_ui/favicons'
  # autoload :HtmlAttributesConcern, 'kitsune_ui/html_attributes_concern'
  # autoload :LookbookPanel,         'kitsune_ui/lookbook_panel'
  # autoload :StatusConcern,         'kitsune_ui/status_concern'
  # autoload :StimulusAttributes,    'kitsune_ui/stimulus_attributes'
  # autoload :SvgIconDownloader,     'kitsune_ui/svg_icon_downloader'
  # autoload :SvgIcons,              'kitsune_ui/svg_icons'
  # autoload :TailwindUtilities,     'kitsune_ui/tailwind_utilities'
  # autoload :ViewComponent,         'kitsune_ui/view_component'
  # autoload :ViewComponentHelper,   'kitsune_ui/view_component_helper'
  # autoload :ViewComponentPreview,  'kitsune_ui/view_component_preview'

end
