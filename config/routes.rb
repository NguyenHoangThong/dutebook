Rails.application.routes.draw do
  get 'books/index'
  get 'books/new'
  get 'books/show'
  get 'home/video'
  get 'home/show'
  get 'home/search'
  get 'home/faci'
  get 'home/index'
  
  #delete 'books/destroy'
  resource :books

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users#, :controllers => { :sessions => "users/sessions" }
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
