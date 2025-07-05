# frozen_string_literal: true

Rails.application.routes.draw do
  get 'up',
    to: 'rails/health#show',
    as: :rails_health_check

  # ==== System

  get 'manifest',
    to: 'rails/pwa#manifest',
    as: :pwa_manifest

  get 'service-worker',
    to: 'rails/pwa#service_worker',
    as: :pwa_service_worker

  # ==== Pages

  root to: 'pages#welcome'
end
