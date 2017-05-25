Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'questions#index'
  resources :questions do
    resources :answers, except: [:show] do
      resources :comments, except: [:show], module: :answers
    end
    resources :comments, except: [:show], module: :questions
  end
  resources :votes, only:[:create,:update, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
