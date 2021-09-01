Rails.application.routes.draw do
  root to: 'tasks#index'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users

  get 'tasks/show_mine', to: 'tasks#show_mine'
  get 'tasks/asign', to: 'tasks#asign'
  resources :tasks
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
