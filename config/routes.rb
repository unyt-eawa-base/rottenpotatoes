Rottenpotatoes::Application.routes.draw do
  resources :movies
  root to: redirect('/movies')
  get 'login' => 'sessions#new', as: 'login'
  post 'login' => 'sessions#create'
  post 'logout' => 'sessions#destroy', as: 'logout'
end
