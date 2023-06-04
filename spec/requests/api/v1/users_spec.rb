require "swagger_helper"

RSpec.describe "api/v1/users", type: :request do

  # L O G I N
  path "/api/v1/users/login" do
    post("login user") do
      description "Log a user in"
      tags "Users"
      consumes "application/json"
      parameter name: :login, in: :body, schema: {
        type: "object",
        properties: {
          email: { type: "string" },
          password: { type: "string" },
        },
      }
      response(200, "successful") do
        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true),
            },
          }
        end
        run_test!
      end
    end
  end

  # C R E A T E
  path "/api/v1/users/create" do
    post("create user") do
      description "Create a new user"
      tags "Users"
      consumes "application/json"
      parameter name: :create, in: :body, schema: {
                  type: "object",
                  properties: {
                    email: { type: "string" },
                    first_name: { type: "string" },
                    last_name: { type: "string" },
                    password: { type: "string" },
                  },
                }
      response(200, "successful") do
        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true),
            },
          }
        end
        run_test!
      end
    end
  end

  # M E
  path "/api/v1/users/me" do
    get("me user") do
      description "Return a single user"
      tags "Users"
      security [bearer_auth: []]
      response(200, "successful") do
        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true),
            },
          }
        end
        run_test!
      end
    end
  end

  # L O G O U T
  path "/api/v1/users/logout" do
    delete("logout user") do
      description "Log a user out"
      tags "Users"
      security [bearer_auth: []]
      response(200, "successful") do
        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true),
            },
          }
        end
        run_test!
      end
    end
  end

  # I N D E X
  path "/api/v1/users/index" do
    get("list users") do
      description "Return a list of all users"
      tags "Users"
      security [bearer_auth: []]
      response(200, "successful") do
        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true),
            },
          }
        end
        run_test!
      end
    end
  end

  # U P D A T E
  path "/api/v1/users/update" do
    put("update user") do
      description "Update a user"
      tags "Users"
      security [bearer_auth: []]
      consumes "application/json"
      parameter name: :update, in: :body, schema: {
                  type: "object",
                  properties: {
                    id: { type: "number" },
                    email: { type: "string" },
                    first_name: { type: "string" },
                    last_name: { type: "string" },

                  },
                }
      response(200, "successful") do
        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true),
            },
          }
        end
        run_test!
      end
    end
  end
end
