Rails.application.routes.draw do
 
  resources :appointments
  resources :vendors
  resources :docks
  resources :states
  resources :dock_workers

  get '/check',:to=>'appointments#check',:as=> "check_availability"
  get '/dock_workers/:id/archived', :to => 'dock_workers#archived', :as => :archived
  get 'dock_report/',:to=>'docks#report',:as=>'dock_report'
  get 'dock_worker_report/',:to=>'dock_workers#report',:as=>'dock_worker_report'
  get ':id/dock_worker_payment/',:to=>'dock_workers#payment',:as=>'dock_worker_payment'
  get ':id/make_payment/',:to=>'dock_workers#make_payment',:as=>'make_payment'

  post '/add_worker'=>'worker_schedules#create',:as=>"add_worker"
  match '/remove_worker'=>'worker_schedules#destroy',:as=>"remove_worker",via:[:post,:delete]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'dock_workers#index'

end
