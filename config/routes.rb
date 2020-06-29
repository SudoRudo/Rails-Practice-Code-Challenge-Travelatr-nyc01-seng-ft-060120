Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
  resources :destinations
  resources :bloggers

  get '/posts/:id/like', to: 'posts#like', as: 'like_post'
  post '/posts/:id', to: 'posts#like'


end
