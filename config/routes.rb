Rails.application.routes.draw do

  resources :questions do
    resources :comments, module: :questions
    resources :answers
  end

  resources :answers do
    resources :comments, module: :answers
  end

  devise_for :users
  get 'home/index'
  root 'questions#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
