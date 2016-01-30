Rails.application.routes.draw do
  resources :textbooks
  root "textbooks#welcome"
  post '/', to: 'textbooks#welcome_check'
end
