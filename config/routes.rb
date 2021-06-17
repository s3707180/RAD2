Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/' => 'attempts#quiz'
  get 'attempts/quiz'
  get 'attempts/result'

  # resources :attempts
  
  
end
