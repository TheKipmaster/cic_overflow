Rails.application.routes.draw do
  resources :comments
  resources :answers
  resources :questions
  devise_for :users
  get 'home/index'
  root 'questions#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
