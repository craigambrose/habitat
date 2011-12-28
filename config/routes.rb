SimpleFormBootstrap::Application.routes.draw do
  devise_for :users

  resources :sites do
    resources :goals
  end
  
  # This is just for testing purposes
  resources :articles do
    resources :comments, :only => :create, :controller => 'articles/comments'
  end

  root :to => 'sites#index'
end
