module Api
  module V1
    class LiquorsController < Api::V1::ApplicationController
      def index
        liquors = Liquor.all
        payload = {
          liquor: LiquorBlueprint.render_as_hash(liquors),
        }
        render_success(payload: payload, status: 200)
      end

      def create
        result = Api::Liquors.new_liquor(params, @current_user)
        render_error(errors: "There was a problem adding the liquor", status: 400) and return unless result.success?
        payload = {
          liquor: LiquorBlueprint.render_as_hash(result.payload),
          status: 201,
        }
        render_success(payload: payload)
      end

      def show
        liquor = Liquor.find(params[:id])
        payload = {
          liquor: LiquorBlueprint.render_as_hash(liquor),
        }
        render_success(payload: payload, status: 200)
      end

      def update
        pliquor = Liquor.find(params[:id])
        result = Api::Liquors.update_liquor(params)
        render_error(errors: "There was an error updating the liquor", status: 400) and return unless result.success?
        previous_values = {
          id: pliquor[:id],
          name: pliquor[:name],
          brand: pliquor[:brand],
          description: pliquor[:description],
          image_path: pliquor[:image_path],
        }
        payload = {
          liquor: LiquorBlueprint.render_as_hash(result.payload),
          previous_values: previous_values,
          status: 201,
        }
        render_success(payload: payload)
      end

      def delete
        result = Api::Liquors.delete_liquor(params)
        render_error(errors: "There was an error deleting the liquor", status: 400) and return unless result.success?
        payload = {
          status: "success",
          message: "The liquor was successfully deleted",
          liquor: LiquorBlueprint.render_as_hash(result.payload),
          status: 201,
        }
        render_success(payload: payload)
      end
    end
  end
end
