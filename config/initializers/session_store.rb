require 'host_config'

host_config = HostConfig.new

Rails.application.config.session_store :cookie_store,
  key:          host_config.session_key,
  expire_after: Rails.env.local? ? 1.year : 2.weeks,
  httponly:     true,
  same_site:    :strict,
  secure:       !Rails.env.local?
