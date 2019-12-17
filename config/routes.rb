Rails.application.routes.draw do

  root 'tops#index'

  devise_for :right_holders, path: 'right_holders', controllers: {
    sessions: 'right_holders/sessions',
    passwords: 'right_holders/passwords',
    registrations: 'right_holders/registrations',
    confirmations: 'right_holders/confirmations'
  }
  devise_for :clients, path: 'clients', controllers: {
    sessions: 'clients/sessions',
    passwords: 'clients/passwords',
    registrations: 'clients/registrations',
    confirmations: 'clients/confirmations'
  }
  resources :clients, only: [:index, :show]
  resources :right_holders, only: [:show]

  resources :films

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
