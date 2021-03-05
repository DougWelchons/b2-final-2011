Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :flights, only: [:index, :show]
  delete "/flight/flight_id/passengers/passenger_id", to: "passenger_flights#destroy"
end
