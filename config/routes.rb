Rails.application.routes.draw do

  resources :questions do
    resources :comments, module: :questions
    resources :answers
  end

  resources :answers do
    resources :comments, module: :answers
  end

  post '/questions/:id/upvote', to: 'questions#upvote', as: 'upvote_question'
  post '/questions/:id/downvote', to: 'questions#downvote', as: 'downvote_question'

  post '/answers/:id/upvote', to: 'answers#upvote', as: 'upvote_answer'
  post '/answers/:id/downvote', to: 'answers#downvote', as: 'downvote_answer'

  devise_for :users
  get 'home/index'
  root 'questions#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
