Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :recipes, path_names: {new: 'add_recipe'}

  resources :users, except: [:index, :show] 

  #resources :logins, only: [:create, :new, :destroy]

  #get 'logout', to: 'logins#destroy'

  root 'recipes#index'

end
