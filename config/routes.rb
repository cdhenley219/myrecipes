Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :recipes, path_names: {new: 'add_recipe'}

  resources :users, except: [:index, :show, :destroy] 

  get 'login', to: 'users#login'

  root 'recipes#index'

end
