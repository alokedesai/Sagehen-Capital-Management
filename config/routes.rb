Scm::Application.routes.draw do
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

  scope "/admin" do
    resources :alums
  end

  # about
  scope "/about" do
    get "/" => "about#index"
    get "mission" => "about#mission"
    get "history" => "about#history"
    get "investment_philosophy" => "about#investment_philosophy"
  end

  resources :resources, only: [:index]
  resources :recruiters, only: [:new, :create]
  resources [:posts], only [:index, :show], :as "market-insights"

end
