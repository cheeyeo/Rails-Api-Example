Rails.application.routes.draw do
  def api_version(version:, default: false, &routes)
    api_constraint = ApiConstraints.new(version: version, default: default)
    scope(module: "v#{version}", constraints: api_constraint, &routes)
  end

  namespace :api, defaults: {format: 'json'} do
    api_version(version: 1) do
      resources :articles, only: :index
    end

    api_version(version: 2, default: true) do
      resources :articles, only: :index
    end
  end
end
