Rails.application.routes.draw do
  resources :survey_q_item_lists
  resources :survey_q_items
  resources :surveys
  resources :records
  resources :tests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'surveys#index'
  mount RailsStudy::Base => '/'
end
