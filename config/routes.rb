Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  mount GraphiQL::Rails::Engine, at: "/", graphql_path: "/graphql"
end
