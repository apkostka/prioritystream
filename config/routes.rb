Prioritystream::Application.routes.draw do

  root :to => 'home#index'

  resources :tasks

  resources :users

end
