Rails.application.routes.draw do
  root 'welcome#index'
  resources :book, only: [:create, :index]
end
