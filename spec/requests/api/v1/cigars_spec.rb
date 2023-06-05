require "swagger_helper"

RSpec.describe "api/v1/cigars", type: :request do
  path "/api/v1/cigars/create" do

    # C R E A T E
    post("create cigar") do
      description "Create a new cigar"
      tags "Cigars"
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
  path "/api/v1/cigars/index" do
    get("list cigars") do
      description "List all cigars"
      tags "Cigars"
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
  path "/api/v1/cigars/update" do
    put("update cigar") do
      description "Update a cigar"
      tags "Cigars"
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
  path "/api/v1/cigars/delete" do
    delete("delete cigar") do
      description "Delete a cigar"
      tags "Cigars"
      security [bearer_auth: []]
      consumes "application/json"
      parameter name: :update, in: :body, schema: {
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
  path "/api/v1/cigars/show" do
    get("show cigar") do
      description "List a single cigar"
      tags "Cigars"
      security [bearer_auth: []]
      parameter name: :id, in: :query, required: true, schema: {
                  type: "integer",
                  description: "ID of the cigar",
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
