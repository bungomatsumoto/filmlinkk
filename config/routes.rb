Rails.application.routes.draw do
  root 'tops#index'
  devise_for :right_holders
  devise_for :clients

  resources :films

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
