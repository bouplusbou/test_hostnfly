Rails.application.routes.draw do
  resources :listings
  resources :bookings
  resources :reservations
  resources :missions
end
