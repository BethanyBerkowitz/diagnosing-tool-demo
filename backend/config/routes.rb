Rails.application.routes.draw do
  resources :symptoms, only: [:index, :show]
  resources :diagnoses, only: [:index, :show]
  resources :diagnosis_frequencies, only: [:index, :show, :create]
end
