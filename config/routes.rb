App1::Application.routes.draw do
  resources :emails
  
  root :to => 'emails#index'
end
