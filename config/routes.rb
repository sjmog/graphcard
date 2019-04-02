Rails.application.routes.draw do
  devise_for :users
  resources :cards
  get '/learn', to: "learn#current_repetition", as: :learn
  post '/learn/cards/:id', to: "learn#respace", as: :respace
  root to: "cards#index"
end
