class HostConfig

  class << self

    def app_name
      Rails.application.class.module_parent.to_s.underscore
    end

  end

  delegate \
    :app_name,
    to: self

  def asset_url
    url = build_url(
      host:     default_host,
      port:     port,
      protocol: protocol
    )

    ENV.fetch('ASSET_URL', url)
  end

  def cookie_domain
    deployed? ? default_host : :all
  end

  # Returns the first hostname defined in `X_APP_HOST` as the default host.
  #
  def default_host
    hosts.first.delete_prefix('.')
  end

  def default_host_with_port
    [ default_host, port ].compact_blank.join(':')
  end

  def default_url_options
    {
      host:       default_host,
      port:       port,
      protocol:   protocol,
      tld_length: tld_length
    }.compact_blank
  end

  # Returns an array of hostnames defined in `X_APP_HOST`. Defaults to
  # `.localhost` if the environment variable is not set.
  #
  # @example Setting a single host
  #   X_APP_HOST=.localhost
  #
  # @example Setting multiple hosts
  #   X_APP_HOST=.example.com,test.example.net
  #
  # @return [Array<String>] the hosts
  #
  def hosts
    ENV.fetch('X_APP_HOST', '.localhost')
      .split(',')
      .map(&:strip)
      .compact_blank
      .uniq
  end

  def hosts_urls
    hosts.map do |host|
      build_url(
        host:     host.delete_prefix('.'),
        port:     port,
        protocol: protocol
      )
    end
  end

  def protocol
    force_ssl? ? :https : :http
  end

  def port
    return if deployed?

    ENV.fetch('PORT', 3000)
  end

  # Set `TLD_LENGTH` for multipart TLDs. For example, `example.co.za`'s TLD
  # length is 2. Defaults to 1.
  #
  def tld_length
    ENV.fetch('TLD_LENGTH', 1).to_i
  end

  def vite_host_with_port
    return if deployed?

    [
      ENV['VITE_RUBY_HOST'],
      ENV['VITE_RUBY_PORT']
    ].compact_blank.join(':')
  end

  private

    def build_url(options)
      ActionDispatch::Http::URL.full_url_for(options.compact_blank)
    end

    def force_ssl?
      deployed?
    end

    def hostname_uri(url)
      URI.parse(url).hostname
    end

    # ==== Environment predicates

    def local?
      Rails.env.local?
    end

    def deployed?
      !local?
    end

end
