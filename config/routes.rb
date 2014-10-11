Scm::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :users
  resources :stocks do
    collection do
      get "gspc"
      get "dia"
      get "ixic"
      get "graph"
      get "portfolio_data"
    end
  end


  # linkedin authentication
  get 'auth/:provider/callback' => 'sessions#create'
  get 'auth/failure' => redirect('/')
  get 'signout' => 'sessions#destroy', as: 'signout'

  root 'users#index'

  namespace :admin do
    resources :alums, except: [:show]
    resources :stocks
    resources :resources
    resources :posts
    resources :users, only: [:show, :edit, :update, :destroy]
    resources :current_managers
    resources :recruiters, only: [:index]
  end

  # static pages
  scope "/about" do
    get "overview" => "static_pages#overview"
    get "mission" => "static_pages#mission"
    get "history" => "static_pages#history"
    get "alumni" => "static_pages#alumni"
    get "investment_philosophy" => "static_pages#investment_philosophy"
    get "current_management" => "static_pages#current_management"
  end
  get "events" => "static_pages#events"

  resources :resources, only: [:index]
  resources :recruiters, only: [:new, :create]
  resources :posts, only: [:index, :show], :path=> "market-insights"

end
