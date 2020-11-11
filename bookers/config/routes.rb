Rails.application.routes.draw do
  resources :blogs
  get 'top' => 'books#top'
  get 'index' => 'books#index'
  post 'books' => 'books#create'
end
