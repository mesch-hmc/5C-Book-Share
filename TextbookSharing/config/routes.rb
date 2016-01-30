Rails.application.routes.draw do
  resources :textbooks
  root "textbooks#index"
end
