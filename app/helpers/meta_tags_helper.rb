module MetaTagsHelper

  def default_meta_tags
    {
      charset:                        'utf-8',
      site:                           I18n.t('meta_tags.site'),
      description:                    I18n.t('meta_tags.description', default: nil),
      reverse:                        true,
      separator:                      '|',
      viewport:                       'width=device-width, initial-scale=1.0',
      noindex:                        true,
      nofollow:                       true,
      manifest:                       pwa_manifest_path(format: :json),
      'application-name':             I18n.t('meta_tags.site'),
      'apple-mobile-web-app-capable': 'yes',
      'mobile-web-app-capable':       'yes',
      icon:                           [
        { href: '/icon.png', type: 'image/png' },
        { href: '/icon.svg', type: 'image/svg+xml' },
        { href: '/icon.png', type: 'image/png', rel: 'apple-touch-icon' }
      ]
    }.compact_blank
  end

end
