Rails.application.routes.draw do
  devise_for :users
  get 'movies/index'
  get 'movies/show'
  get 'movies/edit'
  get 'movies/create'
  get 'movies/search'
  get 'movies/delete'
  get 'movies/new'
  resources :movies
  root "movies#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
