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
      end

      def update
      end

      def delete
      end
    end
  end
end
