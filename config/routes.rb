Rottenpotatoes::Application.routes.draw do
  resources :movies do
    resources :reviews
  end
  root to: redirect('/movies')
  get 'login' => 'sessions#new', as: 'login'
  post 'login' => 'sessions#create'
  post 'logout' => 'sessions#destroy', as: 'logout'
  get 'profile' => 'moviegoers#show', as: 'profile'
  get 'profile/edit' => 'moviegoers#edit', as: 'edit_profile'
  put 'profile' => 'moviegoers#update'
end
