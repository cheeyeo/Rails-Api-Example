# require 'api_constraints'

Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1) do
      resources :articles, only: :index
    end
    scope module: :v2, constraints: ApiConstraints.new(version: 2, default: :true) do
      resources :articles, only: :index
    end
  end

  root :to => "home#index"
end
