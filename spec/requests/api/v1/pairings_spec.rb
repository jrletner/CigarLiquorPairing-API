require "swagger_helper"

RSpec.describe "api/v1/pairings", type: :request do
  path "/api/v1/pairings/create" do

    # C R E A T E
    post("create pairing") do
      description "Create a pairing"
      tags "Pairings"
      security [bearer_auth: []]
      consumes "application/json"
      parameter name: :create, in: :body, schema: {
                  type: "object",
                  properties: {
                    cigar_id: { type: "number" },
                    liquor_id: { type: "number" },
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
  path "/api/v1/pairings/index" do
    get("list pairings") do
      description "List all pairings"
      tags "Pairings"
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
  path "/api/v1/pairings/update" do
    put("update pairing") do
      description "Update a pairing"
      tags "Pairings"
      security [bearer_auth: []]
      consumes "application/json"
      parameter name: :update, in: :body, schema: {
                  type: "object",
                  properties: {
                    id: { type: "number" },
                    cigar_id: { type: "number" },
                    liquor_id: { type: "number" },
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
  path "/api/v1/pairings/delete" do
    delete("delete pairing") do
      description "Delete a pairing"
      tags "Pairings"
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
  path "/api/v1/pairings/show" do
    get("show pairing") do
      description "Show a single pairing"
      tags "Pairings"
      security [bearer_auth: []]
      consumes "application/json"
      parameter name: :id, in: :query, required: true, schema: {
                  type: "integer",
                  description: "ID of the pairing",
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
