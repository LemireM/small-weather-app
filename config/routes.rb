Rails.application.routes.draw do
  root 'weather#index', to: 'weather#index', as: 'weather_index'
end
