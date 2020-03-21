Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'books/results_index' => 'books#results_index'
  post 'books/result' => 'books#url_from_keyword'
  root to: 'books#search'
end