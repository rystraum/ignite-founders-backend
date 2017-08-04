Rails.application.routes.draw do
  get  '/users', to: 'application#users'
  post '/create_user', to: 'application#create_user'
  post '/update_user/:id', to: 'application#update_user'

  root to: 'application#homepage'
end
