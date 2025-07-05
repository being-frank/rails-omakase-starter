# frozen_string_literal: true

Rails.root.glob('lib/core_extensions/**/*.rb').each { |f| require f }
