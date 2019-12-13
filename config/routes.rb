Rails.application.routes.draw do
  root 'films#index'
  
  resources :films

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
