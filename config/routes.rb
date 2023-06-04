Rails.application.routes.draw do
  mount Rswag::Ui::Engine => "/api-docs"
  mount Rswag::Api::Engine => "/api-docs"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api, defaults: { format: :json } do
    # version 1
    # api/v1
    namespace :v1 do
      # api/v1/users
      namespace :users do
        # api/V1/users/login, to: "users#login"
        post :login
        # api/V1/users/create, to: "users#create"
        post :create
        # api/V1/users/me, to: "users#me"
        get :me
        # api/V1/users/logout, to: "users#logout"
        delete :logout
        # api/V1/users/, to: "users#index"
        get :index
      end
    end
  end
end
