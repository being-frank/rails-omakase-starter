Rails.application.routes.draw do
  mount KitsuneUI::Engine, at: '/kitsune-ui', as: :kitsune_ui
  mount MissionControl::Jobs::Engine, at: :jobs, as: :jobs

  # ==== System

  get 'up', to: 'rails/health#show', as: :rails_health_check
  get 'manifest', to: 'rails/pwa#manifest', as: :pwa_manifest
  get 'service-worker', to: 'rails/pwa#service_worker', as: :pwa_service_worker

  # ==== Pages

  root to: 'pages#welcome'
end
