require "graphiql/rails"

Rails.application.routes.draw do
  root 'api/v1/centers#index'
  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql" if Rails.env.development?
  post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post '/centers', to: 'centers#create'
      get '/centers', to: 'centers#index'
      get '/items', to: 'items#index'
    end
  end
end
