Rails.application.routes.draw do
  root "topics#index"
  devise_for :users
  
end
