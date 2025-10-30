require_relative 'lib/kitsune_ui/version'

Gem::Specification.new do |spec|
  spec.required_ruby_version = '>= 3.3.0'

  spec.name        = 'kitsune_ui'
  spec.version     = KitsuneUI::VERSION
  spec.authors     = [ 'Frank' ]
  spec.email       = [ 'frank@6ix.io' ]
  spec.homepage    = 'https://github.com/6ixlabs/kitsune_ui'
  spec.summary     = 'KitsuneUI design system'
  spec.description = spec.summary
  spec.license     = 'MIT'
  spec.platform    = Gem::Platform::RUBY
  spec.metadata    = {
    'bug_tracker_uri'   => "#{spec.homepage}/issues",
    'changelog_uri'     => "#{spec.homepage}/blob/main/CHANGELOG.md",
    'documentation_uri' => spec.homepage,
    'homepage_uri'      => spec.homepage,
    'source_code_uri'   => spec.homepage
  }

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir[
      '{app,config,lib}/**/*',
      'CHANGELOG.md',
      'MIT-LICENSE',
      'Rakefile',
      'README.md'
    ]
  end

  spec.add_dependency 'dry-initializer-rails'
  spec.add_dependency 'dry-types'
  spec.add_dependency 'lookbook'
  spec.add_dependency 'tailwind_merge'
  spec.add_dependency 'view_component'
  spec.add_dependency 'view_component-contrib'
end
