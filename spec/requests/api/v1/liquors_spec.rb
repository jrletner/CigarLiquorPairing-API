require "swagger_helper"

RSpec.describe "api/v1/liquors", type: :request do

  # C R E A T E
  path "/api/v1/liquors/create" do
    post("create liquor") do
      description "Create a liquor"
      tags "Liquors"
      security [bearer_auth: []]
      consumes "application/json"
      parameter name: :create, in: :body, schema: {
                  type: "object",
                  properties: {
                    name: { type: "string" },
                    brand: { type: "string" },
                    description: { type: "string" },
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

  # I N D E X
  path "/api/v1/liquors/index" do
    get("list liquors") do
      description "Show all liquors"
      tags "Liquors"
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
  path "/api/v1/liquors/update" do
    put("update liquor") do
      description "Update a liquor"
      tags "Liquors"
      security [bearer_auth: []]
      consumes "application/json"
      parameter name: :update, in: :body, schema: {
                  type: "object",
                  properties: {
                    id: { type: "number" },
                    name: { type: "string" },
                    brand: { type: "string" },
                    description: { type: "string" },
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

  # D E L E T E
  path "/api/v1/liquors/delete" do
    delete("delete liquor") do
      description "List a single liquor"
      tags "Liquors"
      security [bearer_auth: []]
      consumes "application/json"
      parameter name: :delete, in: :body, schema: {
                  type: "object",
                  properties: {
                    id: { type: "number" },
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

  # S H O W
  path "/api/v1/liquors/show" do
    get("show liquor") do
      description "List a single liquor"
      tags "Liquors"
      security [bearer_auth: []]
      consumes "application/json"
      parameter name: :id, in: :query, required: true, schema: {
                  type: "integer",
                  description: "ID of the liquor",
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
