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
  get '/dashboard/fetch_selections' => 'dashboard#fetch_selections'
  get '/dashboard/fetch_league' => 'dashboard#fetch_league'

  resources :admins, only: :index
  get '/get_meetings' => 'meetings#get_meetings', :as => 'get_meetings'
  get '/reset_meetings' => 'meetings#reset_meetings', :as => 'reset_meetings'
end
