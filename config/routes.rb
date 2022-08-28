Rails.application.routes.draw do
  root 'pages#index'
  get '/questions', to: 'questions#index'
end
