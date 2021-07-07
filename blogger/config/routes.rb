Blogger::Application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'
  resources :author_sessions, only: [ :new, :create, :destroy ]
  resources :articles 
  resources :comments
  resources :authors
  resources :tags
  
  get 'login'  => 'author_sessions#new'
  get 'logout' => 'author_sessions#destroy'
end
