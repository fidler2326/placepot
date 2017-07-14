Rails.application.routes.draw do
  devise_for :users
  root 'dashboard#index'
  resources :racecards
  resources :leagues
  resources :likes
  resources :meetings
  resources :horses do
    member do
      get 'like'
      get 'unlike'
    end
  end
  resources :tips do
    member do
      put 'like', to: 'tips#upvote'
      put 'dislike', to: 'tips#downvote'
    end
  end
  get '/join' => 'leagues#join'
  get '/dashboard' => 'dashboard#index'

  get '/get_meetings' => 'meetings#get_meetings', :as => 'get_meetings'
end
