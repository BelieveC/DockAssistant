Rails.application.routes.draw do
  resources :reservations
  resources :appointments
  resources :vendors
  resources :docks
  resources :shipments
  resources :states
  resources :dock_workers
  resources :timeslots

  get '/check',:to=>'appointments#check',:as=> "check_availability"
  get '/dock_workers/:id/archived', :to => 'dock_workers#archived', :as => :archived

  post '/add_worker'=>'worker_schedules#create',:as=>"add_worker"
  match '/remove_worker'=>'worker_schedules#destroy',:as=>"remove_worker",via:[:post,:delete]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'dock_workers#index'

end
