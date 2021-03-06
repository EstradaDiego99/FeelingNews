Rails.application.routes.draw do
  get 'calculator/display'
  get 'self/show'
  get 'self/followers'
  get 'self/statistics'
  get 'self/predictions'
  resources :posts
  get 'trending/show'
  root 'self#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
