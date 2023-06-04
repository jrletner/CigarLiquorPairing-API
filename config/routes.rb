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
        # api/V1/users/, to: "users#update"
        #put "/update/:id", to: "users#update"
        put :update
      end

      # api/v1/cigars
      namespace :cigars do
        # api/V1/cigars/create, to: "cigarss#create"
        post :create
        # api/V1/cigars/logout, to: "cigars#logout"
        delete :logout
        # api/V1/cigars/, to: "cigars#index"
        get :index
        # api/V1/cigars/, to: "cigars#update"
        put :update
        # api/V1/cigars/delete, to: "cigars#delete"
        delete :delete
      end

      # api/v1/liquors
      namespace :liquors do
        # api/V1/liquors/create, to: "liquors#create"
        post :create
        # api/V1/liquors/logout, to: "liquors#logout"
        delete :logout
        # api/V1/liquors/, to: "liquors#index"
        get :index
        # api/V1/liquors/, to: "liquors#update"
        put :update
        # api/V1/liquors/delete, to: "liquors#delete"
        delete :delete
      end

      # api/v1/pairings
      namespace :pairings do
        # api/V1/pairings/create, to: "pairings#create"
        post :create
        # api/V1/pairings/logout, to: "pairings#logout"
        delete :logout
        # api/V1/pairings/, to: "pairings#index"
        get :index
        # api/V1/pairings/, to: "pairings#update"
        put :update
        # api/V1/pairings/delete, to: "pairings#delete"
        delete :delete
      end
    end
  end
end
