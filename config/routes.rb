Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "user/registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get 'settings', to: 'welcome#setting'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stock', to: 'stocks#search'
  get 'search_friend', to: 'users#search'
  resources :user_stocks, only: [:create, :destroy, :index]
  resources :friendships
  resources :users, only:[:show]
  get 'my_friends', to: 'users#my_friends'
end
