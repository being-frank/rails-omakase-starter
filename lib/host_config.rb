class HostConfig

  class Error < StandardError; end

  class << self

    def app_name
      Rails.application.class.module_parent.to_s.underscore
    end

  end

  delegate \
    :app_name,
    to: self

  def asset_host_url
    url = build_url(
      protocol: protocol,
      host:     default_host,
      port:     port
    )

    ENV.fetch('ASSET_HOST_URL', url)
  end

  # def cookie_domain
  #   deployed? ? default_host : :all
  # end

  # Returns the first hostname defined in `APP_HOST` as the default host.
  #
  def default_host
    hosts.first.delete_prefix('.')
  end

  def default_host_with_port
    [
      default_host,
      port
    ].compact_blank.join(':')
  end

  def default_url_options
    {
      protocol:   protocol,
      host:       default_host,
      port:       port,
      tld_length: tld_length
    }.compact_blank
  end

  # Returns an array of hostnames defined in `APP_HOST`. Defaults to
  # `.localhost` if the environment variable is not set.
  #
  # @example Setting a single host
  #   APP_HOST=.localhost
  #
  # @example Setting multiple hosts
  #   APP_HOST=.example.com,test.example.net
  #
  # @return [Array<String>] the hosts
  #
  def hosts
    raise(Error, 'APP_HOST is not set') if ENV['APP_HOST'].blank?

    ENV.fetch('APP_HOST', '.localhost')
      .split(',')
      .map(&:strip)
      .compact_blank
      .uniq
  end

  def hosts_urls
    hosts.map do |host|
      build_url(
        protocol: protocol,
        host:     host.delete_prefix('.'),
        port:     port
      )
    end
  end

  def protocol
    ssl_connection? ? :https : :http
  end

  def port
    ENV.fetch('PORT', nil)
  end

  def session_key
    ssl_connection? ? "__Host-Http-#{app_name}_session" : "_#{app_name}_session"
  end

  # Set `TLD_LENGTH` for multipart TLDs. For example, `example.co.za`'s TLD
  # length is 2. Defaults to 1.
  #
  def tld_length
    ENV.fetch('TLD_LENGTH', 1).to_i
  end

  def vite_url(protocol: nil)
    return if deployed?

    vite_config = ViteRuby.config

    build_url(
      protocol: protocol.presence || vite_config.protocol,
      host:     vite_config.host.delete_prefix('.'),
      port:     vite_config.port
    )
  end

  # ==== CSP

  def csp_connect_src
    return if deployed?

    vite_url(protocol: :ws)
  end

  def csp_font_src
    csp_asset_src
  end

  def csp_img_src
    csp_asset_src
  end

  def csp_script_src
    csp_asset_src
  end

  def csp_style_src
    csp_asset_src
  end

  private

    def build_url(options)
      ActionDispatch::Http::URL.full_url_for(options.compact_blank)
    end

    def csp_asset_src
      asset_host_url
    end

    def ssl_connection?
      deployed?
    end

    def to_uri(url)
      uri = URI.parse(url)
      uri.to_s.delete_prefix("#{uri.scheme}://")
    end

    # ==== Environment predicates

    def local?
      Rails.env.local?
    end

    def deployed?
      !local?
    end

end
