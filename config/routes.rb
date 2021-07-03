Rails.application.routes.draw do
  devise_for :users, controllers: {   registrations: 'users/registrations',
                                    sessions: 'users/sessions' }
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :users, only: [:show]
  get 'hello' => 'hello#index'
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :replies, only: [:create]
    
  end
  root 'posts#index'

end
