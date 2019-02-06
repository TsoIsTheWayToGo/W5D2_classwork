Rails.application.routes.draw do

  resources :users 
  resources :posts, except: [:index] do 
    resources :comments, only:[:new]
  end 
  resources :comments, only:[:create, :show]
  resources :subs, except: [:destroy] 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
