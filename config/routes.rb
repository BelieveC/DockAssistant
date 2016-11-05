Rails.application.routes.draw do
  resources :reservations
  resources :appointments
  resources :vendors
  resources :docks
  resources :shipments
  resources :states
  resources :dock_workers
  resources :timeslots

  get '/dock_workers/:id/archived', :to => 'dock_workers#archived', :as => :archived

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'dock_workers#index'

end
