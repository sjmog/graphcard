Rails.application.routes.draw do
  resources :cards
  get '/learn', to: "learn#random", as: :learn
  post '/learn/cards/:id', to: "learn#respace", as: :respace
  root to: "cards#index"
end
