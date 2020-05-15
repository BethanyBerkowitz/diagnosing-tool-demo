Rails.application.routes.draw do
  resources :symptoms, only: [:index, :show]
  resources :diagnoses, only: [:index, :show]
  resources :diagnosis_frequencies, only: [:index, :show, :create]
  get '/most_frequent_diagnosis/:symptom_id', to: 'diagnosis_frequencies#most_frequent_diagnosis'
end
