Rails.application.routes.draw do
  devise_for :users

  root "topics#index"


end
