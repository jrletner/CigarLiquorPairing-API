module Api
  module V1
    class CigarsController < Api::V1::ApplicationController
      def index
        cigars = Cigar.all
        payload = {
          cigar: CigarBlueprint.render_as_hash(cigars),
        }
        render_success(payload: payload, status: 200)
      end

      def create
        result = Api::Cigars.new_cigar(params, @current_user)
        render_error(errors: "There was a problem adding the cigar", status: 400) and return unless result.success?
        payload = {
          cigar: CigarBlueprint.render_as_hash(result.payload),
          status: 201,
        }
        render_success(payload: payload)
      end

      def show
        cigar = Cigar.find(params[:id])
        payload = {
          cigar: CigarBlueprint.render_as_hash(cigar),
        }
        render_success(payload: payload, status: 200)
      end

      def update
        pcigar = Cigar.find(params[:id])
        result = Api::Cigars.update_cigar(params)
        render_error(errors: "There was an error updating the cigar", status: 400) and return unless result.success?
        previous_values = {
          id: pcigar[:id],
          name: pcigar[:name],
          brand: pcigar[:brand],
          description: pcigar[:description],
          image_path: pcigar[:image_path],
        }
        payload = {
          cigar: CigarBlueprint.render_as_hash(result.payload),
          previous_values: previous_values,
          status: 201,
        }
        render_success(payload: payload)
      end

      def delete
        result = Api::Cigars.delete_cigar(params)
        render_error(errors: "There was an error deleting the cigar", status: 400) and return unless result.success?
        payload = {
          status: "success",
          message: "The cigar was successfully deleted",
          cigar: CigarBlueprint.render_as_hash(result.payload),
          status: 201,
        }
        render_success(payload: payload)
      end
    end
  end
end
