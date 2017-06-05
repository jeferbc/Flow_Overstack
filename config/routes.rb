Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'questions#index'
  put 'questions/:id/track_view', to: 'questions#track_view', as: 'track_view'
  resources :questions do
    resources :answers, except: [:show] do
      resources :comments, except: [:show], module: :answers
      resources :votes, only:[:create,:update, :destroy], module: :answers
    end
    resources :votes, only:[:create,:update, :destroy], module: :questions
    resources :comments, except: [:show], module: :questions
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
