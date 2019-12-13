Rails.application.routes.draw do
  devise_for :clients
  root 'films#index'
  
  resources :films

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
