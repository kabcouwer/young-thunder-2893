Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/studios', to: 'studios#index'
  get 'movies/:id', to: 'movies#show'
  get 'movies/:id/actors/new', to: 'movie_actors#new'
  post 'movies/:id', to: 'movie_actors#create'

end
