Rails.application.routes.draw do
  mount MissionControl::Jobs::Engine, at: '/jobs'

  # ==== System

  get 'up', to: 'rails/health#show', as: :rails_health_check
  get 'manifest', to: 'rails/pwa#manifest', as: :pwa_manifest
  get 'service-worker', to: 'rails/pwa#service_worker', as: :pwa_service_worker

  # ==== Pages

  root to: 'pages#welcome'
end
