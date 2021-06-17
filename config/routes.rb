Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/' => 'attempts#start'
  get 'attempts/start'
  get 'attempts/quiz'
  post 'attempts/quiz'
  get 'attempts/result'
  get 'attempts/clean'
  get '/clean' => 'attempts#clean'

  # resources :attempts
  
  
end
