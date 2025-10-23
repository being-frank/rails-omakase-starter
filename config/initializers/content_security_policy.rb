require 'host_config'

# Be sure to restart your server when you modify this file.

# Define an application-wide content security policy.
# See the Securing Rails Applications Guide for more information:
# https://guides.rubyonrails.org/security.html#content-security-policy-header

host_config = HostConfig.new

Rails.application.configure do
  config.content_security_policy do |policy|
    policy.default_src(
      :none
    )

    policy.base_uri(
      :none
    )

    policy.connect_src(*[
      :self,
      host_config.csp_connect_src
    ].compact)

    policy.font_src(
      :self,
      host_config.csp_font_src
    )

    policy.form_action(
      :self
    )

    policy.frame_src(
      :self
    )

    policy.frame_ancestors(
      :self
    )

    policy.img_src(
      :self,
      host_config.csp_img_src
    )
    policy.manifest_src(
      :self
    )

    policy.media_src(
      :self
    )

    policy.object_src(
      :none
    )

    policy.script_src(
      :strict_dynamic,
      host_config.csp_script_src
    )

    policy.style_src(
      :self,
      :unsafe_inline,
      host_config.csp_style_src
    )

    # policy.report_uri '/csp-report'
  end

  # Generate session nonces for permitted importmap, inline scripts, and inline styles.
  config.content_security_policy_nonce_generator  = ->(request) { request.session.id.to_s }
  config.content_security_policy_nonce_directives = %w[script-src style-src]

  # Report violations without enforcing the policy.
  config.content_security_policy_report_only = true
end
