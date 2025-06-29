# Rails.application.config.session_store :cookie_store,
#   key:          "_#{HostConfig.app_name}_session",
#   expire_after: 2.weeks,
#   secure:       Rails.env.production?,
#   httponly:     true,
#   same_site:    :lax


require 'host_config'

host_config = HostConfig.new

Rails.application.config.session_store :cache_store,
  key:          host_config,
  compress:     true,
  pool_size:    5,
  expire_after: Rails.env.production? ? 14.days : 1.year,
  same_site:    :strict
