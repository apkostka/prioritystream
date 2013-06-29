Prioritystream::Application.routes.draw do
	
	resources :users
	
	resources :tasks
	match 'tasks' => 'tasks#update_all', :as => :update_all, :via => :put

	resources :sessions, only: [:new, :create, :destroy]

  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  root :to => 'home#index'

end
