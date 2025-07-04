# frozen_string_literal: true

module MetaTagsHelper

  def render_meta_tags
    display_meta_tags(__default_tags)
  end

  private

    def __default_tags
      {
        charset:     'utf-8',
        site:        I18n.t('meta_tags.site'),
        description: I18n.t('meta_tags.description', default: nil),
        reverse:     true,
        separator:   '|',
        viewport:    'width=device-width, initial-scale=1.0',
        noindex:     true,
        nofollow:    true,
        manifest:    pwa_manifest_path(format: :json),
        icon:        [
          { href: '/icon.png', type: 'image/png' },
          { href: '/icon.svg', type: 'image/svg+xml' },
          { href: '/icon.png', rel: 'apple-touch-icon', type: 'image/png' }
        ]
      }.compact_blank
    end

end
