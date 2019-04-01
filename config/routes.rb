Rails.application.routes.draw do
  resources :cards
  get '/learn', to: "learn#random", as: :learn
  root to: "cards#index"
end
