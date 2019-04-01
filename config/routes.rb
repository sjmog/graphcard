Rails.application.routes.draw do
  resources :cards
  get '/learn', to: "learn#current_repetition", as: :learn
  post '/learn/cards/:id', to: "learn#respace", as: :respace
  root to: "cards#index"
end
